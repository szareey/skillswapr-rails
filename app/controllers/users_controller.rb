class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:username, :email, :password, :user_img, :blurb, :show_contact)
  end

end
