class MessageController < ApplicationController

  before_action :authorize

  private

  def message_params
    params.permit(:sender_id, :receiver_id, :content, :response)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end