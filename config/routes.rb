Rails.application.routes.draw do
  
  devise_for :users
  resources :courses
  resources :rounds
  resources :holes
  
  authenticated :user do
    root :to => 'home#dashboard', as: :authenticated_root
  end
  
  root :to => 'home#index'
  
  get 'courses/my_courses'
  get 'handicap/index'
  
end