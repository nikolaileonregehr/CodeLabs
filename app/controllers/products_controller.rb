class ProductsController < ApplicationController
  # this skips login necessity for the index overview
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @products = Product.all
    @products = @products.where('subject ILIKE ?', "%#{params[:query]}%") if params[:query].present?

    respond_to do |format|
      format.html
      format.text { render partial: "products/list", locals: { products: @products }, formats: [:html] }
    end
  end

  def show
    @product = Product.find(params[:id])
    @user = current_user
    lookup_keys = %w[monthly yearly]
    @prices = Stripe::Price.list(lookup_keys: lookup_keys, active: true, expand: ['data.product']).data.sort_by(&:unit_amount)
  end

  private

  def product_params
    params.require(:article).permit(:photo)
  end
end
