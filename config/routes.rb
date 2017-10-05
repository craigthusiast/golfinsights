Rails.application.routes.draw do

  devise_for :users
  
  resources :courses do  # Also how do I include the courses/all route below in here?
    collection { post :import }
    resources :rounds, controller: 'courses/rounds'
  end
  
  resources :rounds do
    collection { post :import }
  end
  
  resources :holes
  
  authenticated :user do
    root :to => 'home#dashboard', as: :authenticated_root
  end
  root :to => 'home#index'
  
  get 'courses/all'
  get 'handicap/index'
  get 'stats/index'
  
end