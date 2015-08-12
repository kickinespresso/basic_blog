require_dependency "basic_blog/application_controller"

module BasicBlog
  class PostsController < ApplicationController

    before_action :set_post, only: [:show]
    before_action :set_recent_posts,  only: [:index, :show]

    # GET /posts
    def index
      @posts = Post.all
    end

    # GET /posts/1
    def show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      def set_recent_posts
        @recent_posts = Post.published.order("published_at DESC").limit(6)
      end
  end
end
