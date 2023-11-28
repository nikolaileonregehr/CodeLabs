class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def product_params
    params.require(:article).permit(:photo)
  end
end
