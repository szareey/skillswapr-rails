class UsersController < ApplicationController

  before_filter do
    get_user_info(current_user) if current_user
  end

  def index
    @users = User.all
  end

  def dashboard
    render :welcome_page unless current_user
  end

  def show
    get_user_info(user)
    @user = user
  end

  def edit
    if current_user == user || current_user.is_admin?
      get_user_info(User.find_by(id: params[:id]))
    else
      flash[:notice] = "You are unauthorized to edit other users profiles"
      redirect_to '/'
    end
  end

  def update
    if current_user == user || current_user.is_admin
      user_params
      @user = user
      @user.update(user_params)
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
    params.require(:user).permit(:username, :email, :password, :user_img, :blurb, :show_contact, :is_admin, :deleted)
  end

  def get_user_info(user)
    if user
      @learnables = user.learnable_skills.map &:name 
      @teachables = user.teachable_skills.map &:name
      @user = user
    end
  end

  def user
    User.find_by(id: params[:id])
  end    

end
