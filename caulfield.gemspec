require File.expand_path("../lib/caulfield/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "caulfield"
  s.version     = Caulfield::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Carl Lerche", "Yehuda Katz"]
  s.email       = ["carlhuda@engineyard.com"]
  s.homepage    = "http://github.com/chanks/caulfield"
  s.summary     = "A Rack middleware for Rails testing."
  s.description = "A Rack middleware to aid in integration testing for Rails 3 and up."

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  s.rubyforge_project         = "caulfield"

  # If you have other dependencies, add them here
  # s.add_dependency "another", "~> 1.2"

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'

  # If you need an executable, add it here
  # s.executables = ["newgem"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end
