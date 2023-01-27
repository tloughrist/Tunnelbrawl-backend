class PlayerController < ApplicationController

  before_action :authorize

  private

  def player_params
    params.permit(:user_id, :game_id, :status, :color)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end