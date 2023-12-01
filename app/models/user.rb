class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :chatrooms_as_teacher, class_name: "Chatroom", foreign_key: :teacher_id
  has_many :chatrooms_as_student, class_name: "Chatroom", foreign_key: :student_id
  has_many :chatrooms_as_gpt_user, class_name: "GptChatroom", foreign_key: :gpt_user_id
  has_many :chatrooms_as_gpt_students, class_name: "GptChatroom", foreign_key: :student_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:student, :teacher, :gpt_user]

end
