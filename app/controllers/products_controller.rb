class ProductsController < ApplicationController
  def product_params
    params.require(:article).permit(:photo)
  end
end
