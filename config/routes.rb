Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :users, only: [:show, :friends] 
  
  resources :dinders, only: [:new, :index, :accept]
  resources :messages
  get 'restaurants/explore', to: 'restaurants#explore', as: 'explore'
  get 'users/:id/friends', to: 'users#friends', as: 'friends'
  get 'dinders/dinder', to: 'dinders#dinder', as: 'dinder'
  get 'dinders/accept', to: 'dinders#accept', as: 'accept'
  get 'dinders/reject', to: 'dinders#reject', as: 'reject'
  post 'messages/destroy', to: 'messages#destroy', as: 'destroy'
  post 'messages/reply', to: 'messages#reply', as: 'reply'
  # post 'dinders/like', to: 'dinders#like', as: 'like'
  post '/dinders/like', to: 'dinders#like', as: 'like'
  
end
