Rails.application.routes.draw do
  root 'static#home'

  resources :users
  
  resources :users, only: [:show] do 
    resources :recipes
  end

  resources :recipes

  resources :sessions, only: [:new, :create, :destroy]
end
