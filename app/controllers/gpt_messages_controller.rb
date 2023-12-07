class GptMessagesController < ApplicationController
  def create
    @gpt_chatroom = GptChatroom.find(params[:gpt_chatroom_id])
    @message = GptMessage.new(message_params)
    @message.gpt_chatroom = @gpt_chatroom
    @message.user = current_user
    if @message.save

      GptChatroomChannel.broadcast_to(
        @gpt_chatroom,
        message: render_to_string(partial: "gpt_message", locals: { message: @message }),
        sender_id: @message.user.id
      )

      client = OpenAI::Client.new
  chaptgpt_response = client.chat(parameters: {
    model: "gpt-3.5-turbo",
    messages: [{ role: "user", content: @message.content }]
  })
  @content = chaptgpt_response["choices"][0]["message"]["content"]
  @gpt_message = GptMessage.new(content: @content, gpt_chatroom: @gpt_chatroom, user: User.find_by(email: "gpt@gpt.com"))
  @gpt_message.save
      GptChatroomChannel.broadcast_to(
        @gpt_chatroom,
        message: render_to_string(partial: "gpt_message", locals: { message: @gpt_message }),
        sender_id: @gpt_message.user.id
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
