class FriendshipController < ApplicationController

  before_action :authorize

  private

  def friendship_params
    params.permit(:friender_id, :friendee_id, :status)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end