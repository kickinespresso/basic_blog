require 'bootstrap-sass'
require 'friendly_id'
require 'simple_form'
require 'acts-as-taggable-on'

module BasicBlog
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    require 'jquery-ui-rails'
    require 'ckeditor'
    isolate_namespace BasicBlog

    config.generators do |g|
      g.test_framework      :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer :basic_blog do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
    end


  end
end
