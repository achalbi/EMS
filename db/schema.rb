# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140422043353) do

  create_table "activities", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "event_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "privacy",     :limit => 255
    t.boolean  "is_admin"
  end

  create_table "activitydetails", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "is_admin"
  end

  create_table "activitynotifications", :force => true do |t|
    t.boolean  "is_unread"
    t.boolean  "is_hidden"
    t.integer  "recepient_id"
    t.integer  "sender_id"
    t.string   "objecttype"
    t.string   "Activitynotificationtype"
    t.string   "body_html"
    t.string   "body_text"
    t.string   "href"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "pic_url"
  end

  create_table "activitynotificationsettings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.boolean  "app"
    t.boolean  "email"
    t.boolean  "phone"
    t.string   "cu_mem_act"
    t.string   "act_inv_me"
    t.string   "following_user_act"
    t.string   "new_joiners"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "activityposts", :force => true do |t|
    t.integer  "post_id"
    t.integer  "activity_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "event_id"
  end

  add_index "activityposts", ["activity_id"], :name => "index_activityposts_on_activity_id"
  add_index "activityposts", ["post_id", "activity_id"], :name => "index_activityposts_on_post_id_and_activity_id", :unique => true
  add_index "activityposts", ["post_id"], :name => "index_activityposts_on_post_id"

  create_table "addresses", :force => true do |t|
    t.string   "doorno"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postalcode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "albumactivities", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "album_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "privacy",        :limit => 255
    t.integer  "user_id"
    t.integer  "cover_photo_id"
    t.string   "type"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "albumable_id"
    t.string   "albumable_type"
    t.string   "downloadlink"
  end

  create_table "attachinary_files", :force => true do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], :name => "by_scoped_parent"

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "username"
  end

  create_table "buysell_item_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "buysell_item_category_subcategories", :force => true do |t|
    t.integer  "buysell_item_category_id"
    t.integer  "buysell_item_subcategory_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "buysell_item_comments", :force => true do |t|
    t.integer  "buysell_item_id"
    t.integer  "comment_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "buysell_item_communities", :force => true do |t|
    t.integer  "buysell_item_id"
    t.integer  "community_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "buysell_item_photos", :force => true do |t|
    t.integer  "buysell_item_id"
    t.integer  "photo_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "buysell_item_subcategories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "buysell_items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.string   "currency"
    t.string   "notes"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "user_id"
    t.integer  "address_id"
    t.string   "condition"
    t.string   "contact_no"
    t.integer  "buysell_item_subcategory_id"
    t.string   "item_type"
    t.integer  "privacy"
    t.integer  "buysell_item_category_id"
  end

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "photo_id"
  end

  add_index "comments", ["user_id", "created_at", "post_id"], :name => "index_comments_on_user_id_and_created_at_and_post_id"

  create_table "communities", :force => true do |t|
    t.integer  "community_id"
    t.integer  "user_id"
    t.integer  "photo_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "name"
    t.text     "description"
    t.integer  "privacy",      :limit => 255
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "comm_type"
  end

  create_table "communityposts", :force => true do |t|
    t.integer  "post_id"
    t.integer  "community_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "event_editor_groups", :force => true do |t|
    t.integer  "event_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "event_editor_groups", ["event_id", "group_id"], :name => "index_event_editor_groups_on_event_id_and_group_id", :unique => true
  add_index "event_editor_groups", ["event_id"], :name => "index_event_editor_groups_on_event_id"
  add_index "event_editor_groups", ["group_id"], :name => "index_event_editor_groups_on_group_id"

  create_table "event_editor_users", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "event_editor_users", ["event_id", "user_id"], :name => "index_event_editor_users_on_event_id_and_user_id", :unique => true
  add_index "event_editor_users", ["event_id"], :name => "index_event_editor_users_on_event_id"
  add_index "event_editor_users", ["user_id"], :name => "index_event_editor_users_on_user_id"

  create_table "event_editors", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "event_editors", ["event_id", "user_id"], :name => "index_event_editors_on_event_id_and_user_id", :unique => true
  add_index "event_editors", ["event_id"], :name => "index_event_editors_on_event_id"
  add_index "event_editors", ["user_id"], :name => "index_event_editors_on_user_id"

  create_table "event_invited_groups", :force => true do |t|
    t.integer  "event_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "event_invited_groups", ["event_id", "group_id"], :name => "index_event_invited_groups_on_event_id_and_group_id", :unique => true
  add_index "event_invited_groups", ["event_id"], :name => "index_event_invited_groups_on_event_id"
  add_index "event_invited_groups", ["group_id"], :name => "index_event_invited_groups_on_group_id"

  create_table "event_invited_users", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "event_invited_users", ["event_id", "user_id"], :name => "index_event_invited_users_on_event_id_and_user_id", :unique => true
  add_index "event_invited_users", ["event_id"], :name => "index_event_invited_users_on_event_id"
  add_index "event_invited_users", ["user_id"], :name => "index_event_invited_users_on_user_id"

  create_table "eventdetails", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "is_admin"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.integer  "privacy",         :limit => 255
    t.integer  "creator"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "community_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "photo_id"
    t.boolean  "GuestsCanInvite"
  end

  add_index "events", ["creator", "created_at", "starts_at", "ends_at"], :name => "inx_evnts"

  create_table "groupposts", :force => true do |t|
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "group_id"
  end

  add_index "groupposts", ["group_id"], :name => "index_groupposts_on_group_id"
  add_index "groupposts", ["post_id", "group_id"], :name => "index_groupposts_on_post_id_and_group_id", :unique => true
  add_index "groupposts", ["post_id"], :name => "index_groupposts_on_post_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "privacy"
    t.integer  "User_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "photo_id"
    t.integer  "community_id"
  end

  add_index "groups", ["User_id"], :name => "index_groups_on_User_id"

  create_table "identities", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "issue_ticket_action_photos", :force => true do |t|
    t.integer  "issue_ticket_action_id"
    t.integer  "photo_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "issue_ticket_actions", :force => true do |t|
    t.integer  "issue_tracker_id"
    t.integer  "ticket_action_id"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "comment"
  end

  create_table "issue_trackers", :force => true do |t|
    t.string   "ticket_id"
    t.string   "version"
    t.text     "description", :limit => 255
    t.string   "module"
    t.string   "priority"
    t.string   "severity"
    t.string   "status"
    t.string   "impact"
    t.integer  "author_id"
    t.integer  "assignee_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.text     "title",       :limit => 255
    t.string   "issue_type"
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "photoalbums", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "album_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "post_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "pic"
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
  end

  create_table "posts", :force => true do |t|
    t.text     "content",            :limit => 255
    t.integer  "user_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "postable_id"
    t.string   "postable_type"
  end

  add_index "posts", ["user_id", "created_at"], :name => "index_posts_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "shares", :force => true do |t|
    t.integer  "share_id"
    t.integer  "album_id"
    t.string   "type"
    t.datetime "creation_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sn_links", :force => true do |t|
    t.string   "fb"
    t.string   "twitter"
    t.string   "google"
    t.string   "linkedin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ticket_actions", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "community_id"
    t.string   "invitation"
    t.boolean  "is_admin"
  end

  add_index "user_groups", ["group_id"], :name => "index_user_groups_on_group_id"
  add_index "user_groups", ["user_id", "group_id"], :name => "index_user_groups_on_user_id_and_group_id", :unique => true
  add_index "user_groups", ["user_id"], :name => "index_user_groups_on_user_id"

  create_table "user_infos", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "home_town"
    t.integer  "current_city"
    t.datetime "dob"
    t.string   "gender"
    t.string   "mobile"
    t.string   "work"
    t.string   "education"
    t.string   "relationship_status"
    t.string   "app_url"
    t.string   "website"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "sn_link_id"
    t.integer  "user_id"
  end

  create_table "usercommunities", :force => true do |t|
    t.integer  "community_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "is_admin"
    t.string   "invitation"
  end

  create_table "userlikes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "admin"
    t.string   "token"
    t.string   "fb_uid"
    t.integer  "address_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
