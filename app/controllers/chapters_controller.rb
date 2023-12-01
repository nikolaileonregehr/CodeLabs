class ChaptersController < ApplicationController
  def show
    set_product
    @chapters = @product.chapters
    @current_chapter = params[:id] ? @product.chapters.find(params[:id]) : @chapters.first
    @gpt_chatroom = GptChatroom.find_by(student_id: current_user.id)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
