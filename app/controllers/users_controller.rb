class UsersController < ApplicationController
  def user_params
    params.require(:article).permit(:photo)
  end
end
