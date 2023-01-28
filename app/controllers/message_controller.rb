class MessageController < ApplicationController

  before_action :authorize

  def create
    message = Message.create(message_params)
    if message.valid?
      render json: message, status: :created
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    head :no_content
  end

  private

  def message_params
    params.permit(:sender_id, :receiver_id, :content, :response)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end