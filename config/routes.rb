Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :users, only: [:show, :friends] 
  
  resources :dinders, only: [:new]
  resources :messages
  get 'restaurants/explore', to: 'restaurants#explore', as: 'explore'
  get 'users/:id/friends', to: 'users#friends', as: 'friends'
  get 'dinders/dinder', to: 'dinders#dinder', as: 'dinder'
end
