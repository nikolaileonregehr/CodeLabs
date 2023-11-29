class ProductsController < ApplicationController
  # this skips login necessity for the index overview
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @products = Product.all
    @products = @products.where('subject ILIKE ?', "%#{params[:query]}%") if params[:query].present?
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:article).permit(:photo)
  end
end
