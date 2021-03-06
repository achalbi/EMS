# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{execjs}
  s.version = "2.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sam Stephenson", "Josh Peek"]
  s.date = %q{2014-06-06}
  s.description = %q{ExecJS lets you run JavaScript code from Ruby.}
  s.email = ["sstephenson@gmail.com", "josh@joshpeek.com"]
  s.homepage = %q{https://github.com/sstephenson/execjs}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Run JavaScript code from Ruby}

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
