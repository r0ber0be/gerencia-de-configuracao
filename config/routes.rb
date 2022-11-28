Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'
  get '/users', to: 'home#index', as: :user
  get '/profile', to: 'profile#index', as: :profile

  devise_for :users
  resources :cities
  resources :city_infos
end
