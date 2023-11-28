class FavoritesController < ApplicationController
  def favorite_params
    params.require(:article).permit(:photo)
  end
end
