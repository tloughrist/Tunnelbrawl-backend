class GameChannel < ApplicationCable::Channel

  def subscribed
    stream_from "game#{params[:id]}"
    game = Game.find(params[:id])
    package = game.package
    ActionCable.server.broadcast("game#{params[:id]}", package)
  end

end