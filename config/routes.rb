ImanPortfolio::Application.routes.draw do
  root 'home#index'

  get "admin", to: 'sessions#new'
  get "logout", to: 'sessions#destroy'
  get "users/new"
  get "users/create"
  get "users/edit"
  get "users/update"
  get "users/destroy"

  resources :admin, only: [:index]
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy] 
  resources :password_resets
end
