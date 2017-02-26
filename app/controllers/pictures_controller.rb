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
      redirect_to pictures_path
    else
      flash[:notice] = 'You have not uploaded anything yet'
      redirect_to new_picture_path
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Your picture was successfully deleted'
    redirect_to pictures_path
  end

  private
  def picture_params
    params.require(:picture).permit(:image)
  end
end
