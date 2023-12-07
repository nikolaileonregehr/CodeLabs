class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user: current_user)
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @favorite.product_id = params[:product_id]
    @favorite.user = current_user
    if @favorite.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:product_id)
  end
end
