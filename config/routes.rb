Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "top#index"
  
  get 'about', to: "top#about"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  
  get "signup", to: "users#new"
  resources :users, only: [:show, :create, :edit, :update, :destroy] do
    member do 
      get :followings 
      get :followers 
      get :likes
      
    end 
  end 
  
  resources :posts do
    member do 
      get :followings
    end 
  end 
  
  resources :relationships, only: [:create, :destroy]
  
  resources :favorites, only: [:create, :destroy]
end
