class ChaptersController < ApplicationController
  def chapter_params
    params.require(:article).permit(:photo)
  end
end
