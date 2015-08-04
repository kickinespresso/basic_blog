module BasicBlog
  class ApplicationController < ActionController::Base

    if BasicBlog.user_class_symbol != :user && !respond_to(:current_user)
      helper_method :authenticate_user!
      helper_method :current_user
      helper_method :user_signed_in?

      def authenticate_user!
        send("authenticate_#{BasicBlog.user_class_underscore_all}!".to_sym)
      end

      def current_user
        send("current_#{BasicBlog.user_class_underscore_all}".to_sym)
      end

      def user_signed_in?
        send("#{BasicBlog.user_class_underscore_all}_signed_in?".to_sym)
      end
    end

    def user_not_authorized
      flash[:error] = "You are not authorized to perform this action."
      redirect_to(request.referrer || "/")
    end
  end
end
