class GptChatroomsController < ApplicationController
  def show
    @gpt_chatroom = GptChatroom.find(params[:id])
    @gpt_messages = GptMessage.new
  end
end
