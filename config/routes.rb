Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "users#show"
  
  get "signup", to: "users#new"
  resources :users, only: [:show, :create, :destroy]
end
