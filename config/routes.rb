Rails.application.routes.draw do
  resources :comments, only: [:create, :edit, :update,:destroy, :show] 
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end
  resources :subs
  resources :users
  resource :session, only: [:new, :create, :destroy]

end
