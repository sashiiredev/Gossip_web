Rails.application.routes.draw do
  root 'static_pages#home'
  resources :gossips do
    resources :comment, except: [:index, :show, :new]
    resources :like, only: [:create, :destroy]
  end
  resources :user, only: [:new, :create, :show]
  resources :city, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
end
