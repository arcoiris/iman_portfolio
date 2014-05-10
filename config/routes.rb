ImanPortfolio::Application.routes.draw do
  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  root 'home#index'

  get "admin", to: 'sessions#new'
  get "logout", to: 'sessions#destroy'
  get "editorial", to: 'photos#editorial'
  get "runway", to: 'photos#runway'
  get "contact", to: 'static_contents#contact'
  get "users/new"
  get "users/create"
  get "users/edit"
  get "users/update"
  get "users/destroy"
  get "users/dashboard"

  resources :static_contents, only: [:edit, :update, :index]
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy] 
  resources :password_resets
  resources :photos
end
