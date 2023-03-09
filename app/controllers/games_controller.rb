class GamesController < ApplicationController

  before_action :authorize

  def create
    game = Game.create(game_params)
    board = game.make_board
    Player.create(user_id: game.host_id, game_id: game.id, color: "red")
    if game.valid?
      package = game.package
      render json: package, status: :created
    else
      render json: { errors: game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def get_public
    games = Game.where(public: true, status: "pending")
    vacancy_games = games.where("no_players < ?", 4)
    current_user = User.find(params[:user_id])
    no_user_vacancy_games = vacancy_games.select {|game| !game.users.include?(current_user)}
    game_pkgs = no_user_vacancy_games.map do |game|
      players = game.players.map {|player| player.user[:username]}
      host = game.host[:username]
      {**game.attributes, players: players, host: host}
    end
    render json: game_pkgs, status: :ok
  end

  def update
    game = Game.find(params[:id])
    if game.players.map{|player| player.user_id.to_i}.include?(session[:user_id])
      game.update(game_params)
      if game.valid?
        package = game.package 
        render json: package, status: :accepted
      else
        render json: { errors: game.errors.full_messages }, status: :unprocessable_entity
      end
    else
      return render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  def initialize_game
    game = Game.find(params[:game_id])
    if game.host.id.to_i == session[:user_id]
      board = game.board
      if game.no_players > 1
        board.begin_game(game.no_players)
        game.update(game_params)
        game.update({status: "in progress"})
        gamePackage = game.package
        game.players.each {|player| player.update({queening: false, status: "active"})}
        render json: gamePackage, status: :accepted
      else
        render json: { errors: "Games require 2-4 players." }, status: :unprocessable_entity
      end
    else
      return render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  def destroy
    game = Game.find(params[:id])
    if game.host.id.to_i == session[:user_id]
      game.destroy
      head :no_content
    else
      return render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  private

  def game_params
    params.permit(:host_id, :title, :no_players, :turn, :round, :phase, :status, :email_notifications, :public)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end