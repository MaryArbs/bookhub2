Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show]
  # resources :favorites
  # resources :authors
  # resources :users
  # resources :books

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
