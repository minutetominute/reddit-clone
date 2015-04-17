Rails.application.routes.draw do
  resources :posts
  resources :subs
  resources :users
  resource :session, only: [:new, :create, :destroy]

end
