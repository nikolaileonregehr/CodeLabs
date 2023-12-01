class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new
    @chatroom.student_id = current_user.id
    teacher_id = User.where(role: "teacher").sample.id
    @chatroom.teacher_id = teacher_id
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end
end
