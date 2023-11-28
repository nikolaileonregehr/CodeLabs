class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :chatrooms_as_teacher, class_name: "Chatroom", foreign_key: :teacher_id
  has_many :chatrooms_as_student, class_name: "Chatroom", foreign_key: :student_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
