Rails.application.routes.draw do
  
  #logging and authentication routes
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  get "/me", to: "users#self"
  delete "/logout", to: "sessions#destroy"

  #standard routes
  resources :games, only: [:create, :update, :destroy]
  resources :boards, only: [:update]
  resources :users, only: [:index, :update, :destroy]
  resources :player, only: [:create, :update, :destroy]
  resources :friendship, only: [:create, :update, :destroy]

  #custom routes
  put "games/initialize/:game_id", to: "games#initialize_game"
  get "users/:user_id/friends", to: "users#get_friends"
  get "users/:user_id/games", to: "users#get_games"

  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
  
end