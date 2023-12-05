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
    @chats = Chatroom.where(student: current_user)
  end

end
