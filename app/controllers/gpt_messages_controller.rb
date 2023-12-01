class GptMessagesController < ApplicationController
  def create
    @chatroom = GptChatroom.find(params[:gpt_chatroom_id])
    @message = GptMessage.new(message_params)
    @message.gpt_chatroom = @chatroom
    @message.user = current_user
    if @message.save
      client = OpenAI::Client.new
  chaptgpt_response = client.chat(parameters: {
    model: "gpt-3.5-turbo",
    messages: [{ role: "user", content: @message.content }]
  })
  @content = chaptgpt_response["choices"][0]["message"]["content"]
  @gpt_message = GptMessage.new(content: @content, gpt_chatroom: @chatroom, user: User.find_by(email: "gpt@gpt.com"))
  @gpt_message.save
      GptChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "gpt_message", locals: {message: @message})
      )
      GptChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "gpt_message", locals: {message: @gpt_message})
      )
      head :ok
    else
      render "gpt_chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:gpt_message).permit(:content)
  end
end