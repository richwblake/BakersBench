Rails.application.routes.draw do
  root 'static#home'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
