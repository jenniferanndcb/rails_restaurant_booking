Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show] do 
    resources :bookings, only: [:new, :create] 
  end 

  resources :restaurants, only: [:new, :create]
    
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/signout', to: "sessions#destroy"
  
  root "welcome#home"

end
