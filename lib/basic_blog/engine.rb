require 'bootstrap-sass'
require 'friendly_id'
require 'simple_form'
require 'carrierwave'
require 'fog/aws/storage'


module BasicBlog
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    require 'jquery-ui-rails'
    require 'ckeditor'
    require 'acts-as-taggable-on'

    isolate_namespace BasicBlog

    config.generators do |g|
      g.test_framework      :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer :basic_blog do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
    end

    # putting this here rather than config/initializers so that Storytime is configured before getting there
    initializer "basic_blog.configure_carrierwave" do
      CarrierWave.configure do |config|
        if BasicBlog.media_storage == :s3
          config.storage = :fog
          config.fog_credentials = {
              :provider               => 'AWS',
              :region                 => BasicBlog.aws_region,
              :aws_access_key_id      => BasicBlog.aws_access_key_id,
              :aws_secret_access_key  => BasicBlog.aws_secret_key
          }
          config.fog_directory  = BasicBlog.s3_bucket
          config.fog_public     = true
          config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
        else
          config.storage = :file
        end

        config.enable_processing = !Rails.env.test?
      end
    end


  end
end
