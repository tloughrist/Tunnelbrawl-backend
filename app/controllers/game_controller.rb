class GameController < ApplicationController

  before_action :authorize

  def create
    game = Game.create(game_params)
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

  def initialize
    Game.update(params[:game_id], :status => 'active')
    game = Game.find(params[:game_id])
    pieces = game.generate_pieces()
    package = {game: game, pieces: pieces}
    render json: package, status: :ok
  end

  private

  def game_params
    params.permit(:host_id, :no_players, :turn, :round, :status)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :game_id
  end

end