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
      render json: game, status: :accepted
    else
      render json: { errors: game.errors.full_messages }, status: :unprocessable_entity
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
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :game_id
  end

end