class ChatoverviewController < ApplicationController
  def index
    @chatoverview = Chatroom.all
  end
end
