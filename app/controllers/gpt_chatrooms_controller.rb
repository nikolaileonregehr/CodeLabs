class GptChatroomsController < ApplicationController
  def show
    @gpt_chatroom = GptChatroom.find(params[:id])
    @gpt_message = GptMessage.new
  end

  def create
    @chatroom = GptChatroom.new
    @chatroom.student_id = current_user.id
    @chatroom.gpt_user_id = User.find_by(role: "gpt_user").id
    @chatroom.save
    redirect_to gpt_chatroom_path(@chatroom)
  end
end
