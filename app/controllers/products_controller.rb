class ProductsController < ApplicationController
  # this skips login necessity for the index overview
  skip_before_action :authenticate_user!, only: :index

  def index
    @products = Product.all
  end

  def product_params
    params.require(:article).permit(:photo)
  end
end
