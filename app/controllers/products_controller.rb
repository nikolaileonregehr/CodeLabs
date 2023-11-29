class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:article).permit(:photo)
  end
end
