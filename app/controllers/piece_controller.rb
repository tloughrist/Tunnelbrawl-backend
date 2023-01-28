class PieceController < ApplicationController

  before_action :authorize

  def update
    piece = Piece.find(params[:id])
    piece.update(piece_params)
    if piece.valid?
      render json: piece, status: :accepted
    else
      render json: { errors: piece.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def piece_params
    params.permit(:game_id, :player_id, :type, :first_move, :location)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end