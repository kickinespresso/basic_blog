BasicBlog::Engine.routes.draw do
  resources :posts
  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  namespace :admin do
    resources :posts
  end

end
