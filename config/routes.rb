Rails.application.routes.draw do
  resources :posts, except: [:index]
  resources :subs
  resources :users
  resource :session, only: [:new, :create, :destroy]

end
