Rails.application.routes.draw do
  root 'static#home'

  resources :users
  
  resources :users, only: [:show] do 
    resources :recipes, except: [:show]
  end

  resources :recipes, only: [:index, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :subscriptions, only: [:create]
end
