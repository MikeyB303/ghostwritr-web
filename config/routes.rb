Rails.application.routes.draw do

  root 'posts#index'
  get '/shakespeare' => 'home#shakespeare'
  get '/rowling' => 'home#rowling'

  resources :posts do 
  	resources :comments, only: [:new, :create, :destroy]
  end
  resources :users, only: [:new, :create, :show] 
  resources :sessions, only: [:new, :create, :destroy]
end
