Rails.application.routes.draw do
  root 'static#home'
  get 'auth/facebook/callback', to: 'sessions#omniauth'
  get '/search', to: 'recipes#search'

  resources :users
  
  resources :users, only: [:show] do 
    resources :recipes, except: [:show]
  end

  resources :recipes, only: [:index, :show, :search, :edit, :update, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

  resources :subscriptions, only: [:create]
end
