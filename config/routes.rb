Rails.application.routes.draw do
  root 'site#home'

  get '/signin', to: 'sessions#new', as: "signin"
  post '/signin', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#facebook'
  get '/signout', to: 'sessions#destroy'
  
  resources :wizards
  resources :courses
  resources :registrations, only: [:new, :create, :edit, :update, :destroy]

  
  resources :courses do 
    resources :registrations, only: [:new, :create, :edit, :update, :destroy]
  end 

  resources :wizards, only: [:index] do 
    resources :registrations, only: [:index]
  end 

end
