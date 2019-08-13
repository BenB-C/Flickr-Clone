class HomeController < ApplicationController

  def index
    if current_user
      @photos = Photo.all
    end
    render :index
  end


end
