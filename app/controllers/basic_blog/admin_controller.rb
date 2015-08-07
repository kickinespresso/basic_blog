require_dependency "basic_blog/application_controller"

module BasicBlog
  class AdminController < ApplicationController
    before_action :authenticate_user!
    layout 'basic_blog/application'

  end

end

