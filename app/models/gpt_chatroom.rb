class GptChatroom < ApplicationRecord
  has_many :gpt_messages
  belongs_to :student, class_name: "User"
  belongs_to :gpt_user, class_name: "User"
end
