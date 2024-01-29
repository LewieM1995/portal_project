Rails.application.routes.draw do
  post 'stripe/webhooks', to: 'stripe/webhooks#create'
  resource :sessions, only: [:new, :create, :destroy]
  get 'dashboard', to: 'dashboard#show', as: 'dashboard'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  resources :client_details, param: :client_id
  get 'signup', to: 'signup#index'
  get 'login', to: 'login#index'
  get 'about', to: 'about#index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
