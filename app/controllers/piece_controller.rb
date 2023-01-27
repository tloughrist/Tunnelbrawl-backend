class PieceController < ApplicationController

  before_action :authorize

  private

  def piece_params
    params.permit(:game_id, :player_id, :type, :first_move :location)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end