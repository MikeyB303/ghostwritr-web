Rails.application.routes.draw do

  root 'posts#index'
  get '/shakespeare' => 'home#shakespeare'
  get '/rowling' => 'home#rowling'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts

end
