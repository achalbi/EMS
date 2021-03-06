# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "node"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rafael Fran\u{c3}\u{a7}a"]
  s.date = "2011-10-18"
  s.description = "Node.js library"
  s.email = "rafaelmfranca@gmail.com"
  s.homepage = "https://github.com/rafaelfranca/node"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Node.js"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, [">= 0"])
    else
      s.add_dependency(%q<eventmachine>, [">= 0"])
    end
  else
    s.add_dependency(%q<eventmachine>, [">= 0"])
  end
end
