class GptChatroomsController < ApplicationController
  def show
    @gpt_chatroom = GptChatroom.find(params[:id])
    @gpt_message = GptMessage.new

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "shared/gptchats", locals: {gpt_chatroom: @gpt_chatroom, gpt_message: @gpt_message}, formats: [:html] }
    end
  end

  def create
    @gpt_chatroom = GptChatroom.new
    @gpt_chatroom.student_id = current_user.id
    @gpt_chatroom.gpt_user_id = User.find_by(role: "user").id
    @gpt_chatroom.save
    redirect_to gpt_chatroom_path(@gpt_chatroom)
  end

  def destroy
    # Find and delete the chat
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy

    # Optionally, respond with a success message or handle redirects
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Chat deleted successfully.' }
      format.json { head :no_content }
    end
  end
end
