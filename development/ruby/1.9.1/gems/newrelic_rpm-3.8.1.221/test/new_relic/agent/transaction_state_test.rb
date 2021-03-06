# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/rpm/blob/master/LICENSE for complete details.

require File.expand_path(File.join(File.dirname(__FILE__),'..','..','test_helper'))
require 'new_relic/agent/transaction'
require 'new_relic/agent/transaction_state'

module NewRelic::Agent
  class TransactionStateTest < Minitest::Test
    attr_reader :state

    def setup
      TransactionState.clear
      @state = TransactionState.get
    end

    def teardown
      TransactionState.clear
    end

    def test_without_transaction_stack_on_thread
      assert_equal false, state.in_background_transaction?
      assert_equal false, state.in_request_transaction?
    end

    def test_in_background_transaction
      in_transaction(:type => :task) do |txn|
        txn.request = nil # this makes it a "background transaction"
        assert state.in_background_transaction?
      end
    end

    def test_in_request_tranasction
      in_transaction do |txn|
        txn.request = stub()

        assert state.in_request_transaction?
      end
    end

    def test_timings_without_transaction
      freeze_time

      state.reset
      timings = state.timings

      assert_equal 0.0, timings.queue_time_in_seconds
      assert_equal 0.0, timings.app_time_in_seconds
      assert_equal nil, timings.transaction_name
    end

    def test_timings_with_transaction
      earliest_time = freeze_time

      in_transaction("Transaction/name") do |txn|
        txn.apdex_start = earliest_time
        txn.start_time = earliest_time + 5

        advance_time(10.0)
        timings = state.timings

        assert_equal 5.0, timings.queue_time_in_seconds
        assert_equal 5.0, timings.app_time_in_seconds
        assert_equal txn.best_name, timings.transaction_name
      end
    end

    def test_guid_from_transaction
      in_transaction do |txn|
        assert_equal state.request_guid, txn.guid
      end
    end

    GUID = "goo-id"

    def test_request_guid_to_include
      with_config(:apdex_t => 2.0) do
        freeze_time

        state.request_token = "token"

        in_transaction do |txn|
          advance_time(4.0)
          assert_equal state.current_transaction.guid, state.request_guid_to_include
        end
      end
    end

    def test_requst_guid_excluded_if_request_fast_enough
      with_config(:apdex_t => 2.0) do
        freeze_time

        state.request_token = "token"
        in_transaction do |txn|
          advance_time(1.0)
          assert_equal "", state.request_guid_to_include
        end
      end
    end

    def test_request_guid_excluded_if_no_token
      with_config(:apdex_t => 2.0) do
        freeze_time

        state.request_token = nil
        in_transaction do |txn|
          advance_time(4.0)
          assert_equal "", state.request_guid_to_include
        end
      end
    end

    def test_no_request_guid_for_event
      state.request_token = nil
      state.is_cross_app_caller = false
      state.referring_transaction_info = nil
      in_transaction do
        assert_nil state.request_guid_for_event
      end
    end

    def test_request_guid_for_event
      state.request_token = nil
      state.is_cross_app_caller = true
      state.referring_transaction_info = nil
      in_transaction do
        assert_equal state.current_transaction.guid, state.request_guid_for_event
      end
    end

    def test_request_guid_for_event_if_referring_transaction
      state.request_token = nil
      state.is_cross_app_caller = false
      state.referring_transaction_info = ["another"]
      in_transaction do
        assert_equal state.current_transaction.guid, state.request_guid_for_event
      end
    end

    def test_request_guid_for_event_if_there_for_rum
      with_config(:apdex_t => 2.0) do
        state.request_token = "token"
        state.is_cross_app_caller = false
        in_transaction do
          advance_time(10.0)
          assert_equal state.current_transaction.guid, state.request_guid_for_event
        end
      end
    end

    def test_reset_should_reset_cat_state
      state.is_cross_app_caller = true
      state.referring_transaction_info = ['foo', 'bar']

      assert_equal(true, state.is_cross_app_callee?)
      assert_equal(true, state.is_cross_app_caller?)

      state.reset

      assert_equal(false, state.is_cross_app_caller?)
      assert_equal(false, state.is_cross_app_callee?)
    end
  end
end
