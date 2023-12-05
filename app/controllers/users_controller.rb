class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def user_params
    params.require(:article).permit(:photo)
  end

  def chats
    if current_user.email == "teacher@teacher.com"
      @chats = Chatroom.all
    else
      @chats = Chatroom.where(student: current_user)
    end
  end

  # if logged in user is teacher
  # get all chatrooms

  # if user is not teacher
  # get only chats where user is student

  def gptchats
    @gptchats = GptChatroom.where(student: current_user)
  end

end
