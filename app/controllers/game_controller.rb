class GameController < ApplicationController

  before_action :authorize

  private

  def game_params
    params.permit(:host_id, :no_players, :turn, :round, :status)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end