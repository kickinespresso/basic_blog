$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "basic_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "basic_blog"
  s.version     = BasicBlog::VERSION
  s.authors     = ["Chris Desch"]
  s.email       = ["cdesch@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of BasicBlog."
  s.description = "TODO: Description of BasicBlog."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency "friendly_id", ">= 5.0"
  s.add_dependency "simple_form", ">= 3.0"
  s.add_dependency "kaminari", ">= 0.15"
  s.add_dependency 'bootstrap-sass', '~> 3.3.4'
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'ckeditor_rails', '~> 4.5.1'
  s.add_dependency "jquery-rails", ">= 3.0"
  s.add_dependency "jquery-ui-rails", "~> 5.0"
  #s.add_dependency 'therubyracer', platforms: :ruby
  s.add_dependency  'acts-as-taggable-on', '~> 3.4'

  s.add_development_dependency "sqlite3"
end
