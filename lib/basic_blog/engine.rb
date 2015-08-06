require 'bootstrap-sass'
require 'friendly_id'
require 'simple_form'

module BasicBlog
  class Engine < ::Rails::Engine
    isolate_namespace BasicBlog
  end
end
