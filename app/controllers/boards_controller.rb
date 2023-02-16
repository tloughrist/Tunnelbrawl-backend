class BoardsController < ApplicationController

  before_action :authorize

  def update
    board = Board.find(params[:id])
    if board.players.map{|player| player.user_id.to_i}.include?(session[:user_id])
      board.update(board_params)
      if board.valid?
        package = board.game.package
        render json: package, status: :accepted
      else
        render json: { errors: board.errors.full_messages }, status: :unprocessable_entity
      end
    else
      return render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  def show_moves
    board = Board.find(params[:board_id])
    game = board.game
    players = game.players
    if players.map{|player| player.user_id.to_i}.include?(session[:user_id])
      board.legal_moves(params[:active_piece])
      package = game.package
      render json: package, status: :accepted
    else
      return render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  def clear_highlights
    board = Board.find(params[:board_id])
    game = board.game
    players = game.players
    if players.map{|player| player.user_id.to_i}.include?(session[:user_id])
      board.clear
      package = game.package
      render json: package, status: :accepted
    else
      return render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  def move_piece
#params: start loc, end loc
  end

  private

  def board_params
    loc_names = params.keys.select { |key| key[/\bloc\d{2,3}\b/] }
    params.permit(*loc_names, :red_capture, :green_capture, :blue_capture, :yellow_capture)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end
