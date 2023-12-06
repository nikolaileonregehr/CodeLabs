class UsersController < ApplicationController
  def show
    @user = current_user
    lookup_keys = %w[monthly yearly]
    @prices = Stripe::Price.list(lookup_keys: lookup_keys, active: true, expand: ['data.product']).data.sort_by(&:unit_amount)
  end

  def user_params
    params.require(:article).permit(:photo)
  end

  def chats
    if current_user.email == "teacher@teacher.com" || "owner@owner.com"
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
