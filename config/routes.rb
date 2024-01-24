Rails.application.routes.draw do
  resources :client_details, param: :client_id
  get 'signup', to: 'signup#index'
  get 'login', to: 'login#index'
  get 'about', to: 'about#index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
