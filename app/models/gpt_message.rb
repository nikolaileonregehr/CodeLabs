class GptMessage < ApplicationRecord
  belongs_to :user
  belongs_to :gpt_chatroom
end
