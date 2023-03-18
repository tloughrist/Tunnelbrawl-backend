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
  resources :players, only: [:create, :update, :destroy]
  resources :friendships, only: [:create, :update, :destroy]

  #custom routes
  get "users/:user_id/friends", to: "users#get_friends"
  get "users/:user_id/games", to: "users#get_games"
  get "users/self", to: "users#self" 
  put "boards/show_moves/:board_id", to: "boards#show_moves"
  put "boards/clear_highlights/:board_id", to: "boards#clear_highlights"
  put "boards/move_piece/:board_id", to: "boards#move_piece"
  get "games/public/:user_id", to: "games#get_public"
  put "games/initialize/:game_id", to: "games#initialize_game"
  put "games/advance/:game_id", to: "games#advance"

  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
  
end