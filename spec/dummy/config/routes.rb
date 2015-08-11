Rails.application.routes.draw do
  #devise_for :users
  devise_for :users
  mount BasicBlog::Engine => "/basic_blog"
end
