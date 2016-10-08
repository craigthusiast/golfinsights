Rails.application.routes.draw do

  devise_for :users
  resources :courses  # change this to include the needed view scopes (including 'all' below)
  resources :rounds
  resources :holes
  
  authenticated :user do
    root :to => 'home#dashboard', as: :authenticated_root
  end
  root :to => 'home#index'
  
  get 'courses/all'
  get 'handicap/index'
  get 'stats/index'
  
end