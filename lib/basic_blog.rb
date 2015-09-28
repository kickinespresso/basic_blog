require "basic_blog/engine"

module BasicBlog

  # AWS Region to use for file uploads.
  mattr_accessor :aws_region
  #@@aws_region = ENV['STORYTIME_AWS_REGION']

  # AWS Access Key ID to use for file uploads.
  mattr_accessor :aws_access_key_id
  #@@aws_access_key_id = ENV['STORYTIME_AWS_ACCESS_KEY_ID']

  # AWS Secret Key to use for file uploads.
  mattr_accessor :aws_secret_key
  #@@aws_secret_key = ENV['STORYTIME_AWS_SECRET_KEY']

  class << self
    attr_accessor :layout, :media_storage, :s3_bucket
    def configure

      yield self
    end

  end
end
