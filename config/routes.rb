Rails.application.routes.draw do
  

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  resources :users, only: [:show]

  get '/auth/:provider/callback' => 'sessions#omniauth'

  
  # resources :favorites
  # resources :authors
  # resources :users
  # resources :books

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
