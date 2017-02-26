class CommentsController < ApplicationController
  def new
    @picture = Restaurant.find(params[:picture_id])
    @comment = Comment.new
    redirect_to pictures_path
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(review_params)
    redirect_to pictures_path
  end

  private

  def review_params
    params.require(:comment).permit(:thoughts)
  end
end
