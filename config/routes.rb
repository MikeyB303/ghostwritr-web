Rails.application.routes.draw do

  root 'posts#index'
  get '/shakespeare' => 'home#shakespeare'
  get '/rowling' => 'home#rowling'

  resources :users, only: [:new, :create] do
    resources :posts
  	resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]
end
