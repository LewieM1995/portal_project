Rails.application.routes.draw do
  resource :admin_sessions, only: [:new, :create, :destroy]
  get '/admins', to: 'admins#index'
  get 'admin_logout', to: 'admin_sessions#destroy', as: 'admin_logout'
  resources :properties
  resources :assignments, only: [:new, :create, :update]
  resource :sessions, only: [:new, :create, :destroy]
  get 'dashboard', to: 'dashboard#show', as: 'dashboard'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  resources :users, param: :client_id
  get 'login', to: 'login#index'
  get 'about', to: 'about#index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
