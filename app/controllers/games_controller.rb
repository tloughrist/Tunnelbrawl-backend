class GamesController < ApplicationController

  before_action :authorize

  def create
    game = Game.create(game_params)
    board = Board.create(game_id: game.id)
    game.update(board_id: board.id)
    if game.valid?
      render json: game, status: :created
    else
      render json: { errors: game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    game = Game.find(params[:id])
    game.update(game_params)
    if game.valid?
      games = game.host.games
      gamePackages = games.map {|game| {game: game, board: game.board} }
      render json: gamePackages, status: :accepted
    else
      render json: { errors: game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def initialize_game
    game = Game.find(params[:game_id])
    board = game.board
    if game.no_players > 1
      board.begin_game(game.no_players)
      game.update(game_params)
      games = game.host.games
      gamePackages = games.map {|game| {game: game, board: game.board} }
      render json: gamePackages, status: :accepted
    else
      render json: { errors: "Games require 2-4 players." }, status: :unprocessable_entity
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    head :no_content
  end

  private

  def game_params
    params.permit(:host_id, :no_players, :turn, :round, :phase, :status)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end