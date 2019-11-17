Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :edit, :update]


  resources :restaurants, only: [:new, :create, :show, :edit, :update, :destroy] do 
    resources :bookings
  end 

  resources :bookings
    
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/signout', to: "sessions#destroy"
  get '/:city', to: "restaurants#index", as: "restaurants_by_city"
  get '/auth/facebook/callback', to: "sessions#create_from_fb"
  
  root "pages#home"

end
