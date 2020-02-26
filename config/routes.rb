Rails.application.routes.draw do
  
  root 'sessions#index'
  
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy', as:'logout'
  
  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  resources :users, only: [:show]


  # resources :authors, only: [:show] do
  #   # nested resource for books
  #   resources :books, only: [:show, :index]
  # end

  
  resources :books 
  
  
  
  resources :books, only: [:show] do  #book has many favorites #parent
    resources :favorites, only: [:index, :new, :create, :show] #belongs_to
  end 
  
  resources :favorites
  
  

 


  
 
 

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
