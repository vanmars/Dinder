Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :users
  resources :users, only: [:show, :friends]
  resources :restaurants
  
  get 'restaurants/explore', to: 'restaurants#explore', as: 'explore'
  get 'users/:id/friends', to: 'users#friends', as: 'friends'
  get "/dinder" => "dinder#dinder", as: :dinder
end
