class MessagesController < ApplicationController
  # this needs to be adapted: leave out GPT code as this chat window is with a teacher only
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      client = OpenAI::Client.new
  chaptgpt_response = client.chat(parameters: {
    model: "gpt-3.5-turbo",
    messages: [{ role: "user", content: @message.content }]
  })
  @content = chaptgpt_response["choices"][0]["message"]["content"]
  @gpt_message = Message.new(content: @content, chatroom: @chatroom, user: User.find_by(email: "gpt@gpt.com"))
  @gpt_message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @gpt_message})
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
