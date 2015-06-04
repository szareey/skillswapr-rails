class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    list_skills(User.find_by(id: params[:id]))
    @user = User.find_by(id: params[:id])
  end

  def edit
    list_skills(User.find_by(id: params[:id]))
  end

  def update
    
    if current_user == User.find_by(id: params[:id])
      user_params
      current_user.update(user_params)
    end
    redirect_to edit_user_path
    
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
