class BoardsController < ApplicationController

  before_action :authorize

  def update
    board = Board.find(params[:id])
    board.update(board_params)
    if board.valid?
      render json: board, status: :accepted
    else
      render json: { errors: board.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.permit(:loc21, :loc31, :loc41, :loc51, :loc26, :loc36, :loc46, :loc56, :loc12, :loc13, :loc14, :loc15, :loc62, :loc63, :loc64, :loc65, :loc101, :loc102, :loc103, :loc104, :loc111, :loc112, :loc113, :loc114, :loc115, :loc116, :loc117, :loc118, :loc201, :loc202, :loc203, :loc204, :loc211, :loc212, :loc213, :loc214, :loc215, :loc216, :loc217, :loc218, :loc301, :loc302, :loc303, :loc304, :loc311, :loc312, :loc313, :loc314, :loc315, :loc316, :loc317, :loc318, :loc401, :loc402, :loc403, :loc404, :loc411, :loc412, :loc413, :loc414, :loc415, :loc416, :loc417, :loc418, :loc22, :loc23, :loc24, :loc25, :loc32, :loc33, :loc34, :loc35, :loc42, :loc43, :loc44, :loc45, :loc52, :loc53, :loc54, :loc55, :loc121, :loc122, :loc123, :loc124, :loc125, :loc126, :loc127, :loc128, :loc129, :loc130, :loc131, :loc132, :loc133, :loc134, :loc135, :loc136, :loc221, :loc222, :loc223, :loc224, :loc225, :loc226, :loc227, :loc228, :loc229, :loc230, :loc231, :loc232, :loc233, :loc234, :loc235, :loc236, :loc321, :loc322, :loc323, :loc324, :loc325, :loc326, :loc327, :loc328, :loc329, :loc330, :loc331, :loc332, :loc333, :loc334, :loc335, :loc336, :loc421, :loc422, :loc423, :loc424, :loc425, :loc426, :loc427, :loc428, :loc429, :loc430, :loc431, :loc432, :loc433, :loc434, :loc435, :loc436
    )
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end
