Rails.application.routes.draw do
  root 'static#home'
  get 'auth/facebook/callback', to: 'sessions#omniauth'

  resources :users
  
  resources :users, only: [:show] do 
    resources :recipes, except: [:show]
  end

  resources :recipes, only: [:index, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :subscriptions, only: [:create]
end
