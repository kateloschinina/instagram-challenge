class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @user = current_user
    if @user
      @picture = @user.pictures.new(user_id: @user.id)
    else
      flash[:notice] = 'Your have to sign up to be able to post pictures'
      redirect_to pictures_path
    end
  end

  def create
    @user = current_user
    if params[:picture]
      @user.pictures.create!(picture_params)
      redirect_to pictures_path
    else
      flash[:notice] = 'You have not uploaded anything yet'
      redirect_to new_picture_path
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.user_id == current_user.id
      @picture.destroy
      flash[:notice] = 'Your picture was successfully deleted'
      redirect_to pictures_path
    else
      flash[:notice] = 'You can not delete someones elses pictures'
      redirect_to pictures_path
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:image)
  end
end
