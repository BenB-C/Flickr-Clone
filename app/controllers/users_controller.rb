class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # @users = User.all
    @user = current_user
    render :index
  end

  def new
    redirect_to new_user_registration_path
  end

end
