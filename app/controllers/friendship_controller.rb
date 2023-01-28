class FriendshipController < ApplicationController

  before_action :authorize
  
  def create
    friendship = Friendship.create(friendship_params)
    if friendship.valid?
      render json: friendship, status: :created
    else
      render json: { errors: friendship.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def friendship_params
    params.permit(:friender_id, :friendee_id, :status)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end