class GameChannel < ApplicationCable::Channel

  def subscribed
    stream_from "game#{params[:id]}"
  end

end