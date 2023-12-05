class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "shared/chats", locals: {chats: @chatroom}, formats: [:html] }
    end
  end

  def create
    @chatroom = Chatroom.new
    @chatroom.student_id = current_user.id
    @chatroom.teacher_id = User.find_by(role: "teacher").id
    @chatroom.title = current_user.first_name
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
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
