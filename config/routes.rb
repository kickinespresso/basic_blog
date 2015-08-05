BasicBlog::Engine.routes.draw do
  resources :posts
  root 'posts#index'

  namespace :admin do
    resources :posts
  end

end
