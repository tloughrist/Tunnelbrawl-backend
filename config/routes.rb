Rails.application.routes.draw do
  
  #Logging and authentication routes
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  get "/me", to: "users#self"
  delete "/logout", to: "sessions#destroy"

  #standard routes
  resources :games, only: [:create, :update, :destroy]
  resources :users, only: [:update, :destroy]
  resources :player, only: [:create, :update, :destroy]
  resources :piece, only: [:update]
  resources :message, only: [:create, :destroy]
  resources :friendship, only: [:create, :update, :destroy]

  #custom routes
  get "games/initialize/:game_id", to: "games#initialize"

end
