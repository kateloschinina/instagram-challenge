class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    if params[:picture]
      Picture.create!(picture_params)
      redirect_to '/pictures'
    else
      flash[:notice] = 'You haven not uploaded anything yet'
      redirect_to '/pictures/new'
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:image)
  end
end
