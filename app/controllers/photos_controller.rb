class PhotosController < ApplicationController

  def new
    @user = current_user
    @photo = Photo.new
    render :new
  end

  def create
    @user = current_user
    @photo = @user.photos.new(photo_params)
    # binding.pry
    if @user.save
      flash[:notice] = {:content => "You've added a photo!", :class => "alert alert-success"}
      redirect_to root_path
    else
      flash[:alert] = {:content => "Whoops! There was an error", :class => "alert alert-danger"}
      redirect_to new_user_photo_path(current_user)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
    render :show
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :description, :image)
  end
end
