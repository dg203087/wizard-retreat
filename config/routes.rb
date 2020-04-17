Rails.application.routes.draw do
  root 'site#home'

  get '/signin', to: 'sessions#new', as: "signin"
  post '/signin', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#facebook'
  get '/signout', to: 'sessions#destroy'
  
  resources :wizards
  resources :courses
  resources :registrations, only: [:new, :create, :destroy] #do I need this route?

  
  resources :courses do 
    resources :registrations
  end 

  resources :wizards, only: [:index] do 
    resources :registrations, only: [:index]
  end 

end
