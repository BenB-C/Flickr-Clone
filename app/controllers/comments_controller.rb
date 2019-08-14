class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new
    render :new
  end

  def create
    content_body = params[:comment][:content_body]
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(content_body: content_body, user_id: current_user.id)
    @photo.save
    # binding.pry
    redirect_to photo_path(@photo)
  end

  # private
  #   def comment_params
  #     user_id = current_user.id
  #     params.require(:comment).permit(:content_body, :user_id)
  #   end

end
