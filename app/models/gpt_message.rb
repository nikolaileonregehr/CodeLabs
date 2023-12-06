class GptMessage < ApplicationRecord
  belongs_to :user
  belongs_to :gpt_chatroom

  def sender?(a_user)
    user.id == a_user.id
  end

end
