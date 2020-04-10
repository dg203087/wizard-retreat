Rails.application.routes.draw do
  root 'site#home'
  resources :wizards, only: [:new, :create, :show]
  resources :courses


  # get '/signup', to: 'wizards#new', as: "signup"
  # post '/signup', to: 'wizards#create'
  get '/signin', to: 'sessions#new', as: "signin"
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

end
