Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :users
  resources :users, only: [:show, :friends]
  
  get 'restaurants/explore', to: 'restaurants#explore', as: 'explore'
  get 'users/:id/friends', to: 'users#friends', as: 'friends'
end
