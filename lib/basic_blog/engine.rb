require 'bootstrap-sass'
require 'friendly_id'
require 'simple_form'
require 'jquery-rails'
require 'jquery-ui-rails'
require 'ckeditor-rails'
require 'acts-as-taggable-on'

module BasicBlog
  class Engine < ::Rails::Engine

    isolate_namespace BasicBlog
  end
end
