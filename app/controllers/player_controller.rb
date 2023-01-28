class PlayerController < ApplicationController

  before_action :authorize

  def create
    player = Player.create(player_params)
    if player.valid?
      render json: player, status: :created
    else
      render json: { errors: player.errors.full_players }, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.permit(:user_id, :game_id, :status, :color)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end