class ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show]

  def show
    @chapters = @product.chapters
    @current_chapter = find_current_chapter
    @gpt_chatroom = GptChatroom.find_by(student_id: current_user.id)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def find_current_chapter
    user = current_user
    chapter = @product.chapters.find(params[:id])
    return chapter if user.status == 'subscribed'

    redirect_to product_path(@product), alert: 'You must be subscribed to access chapters.'
  end
end
