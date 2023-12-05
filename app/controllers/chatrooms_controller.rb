class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "shared/chats", locals: {chats: @chatroom}, formats: [:html] }
    end
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
