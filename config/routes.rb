Rails.application.routes.draw do
  root 'clients#index'
  resources :clients
  resources :countries
  resources :states
  resources :cities
  resources :delivery_types
  resources :organizations
  devise_for :users
end
