class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def user_params
    params.require(:article).permit(:photo)
  end

  def chats
    @chats = Chatroom.where(student: current_user)
  end

  def gptchats
    @gptchats = GptChatroom.where(student: current_user)
  end

end
