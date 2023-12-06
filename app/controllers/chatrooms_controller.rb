class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "shared/chats", locals: {chats: @chatroom}, formats: [:html] }
    end
  end
end
