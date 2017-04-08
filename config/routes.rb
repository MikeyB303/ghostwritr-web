Rails.application.routes.draw do
  root 'home#index'
  get '/shakespeare' => 'home#shakespeare'
  get '/rowling' => 'home#rowling'

  resources :users, only: [:new, :create]
  # TODO restrict sessions routes
  resources :sessions

end
