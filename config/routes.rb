Rails.application.routes.draw do
  root 'home#index'
  get '/shakespeare' => 'home#shakespeare'
  get '/rowling' => 'home#rowling'
  # TODO restrict user paths
  resources :users 

end
