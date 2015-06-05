class UsersController < ApplicationController

  before_filter do
    get_user_info(current_user) if current_user
  end

  def autocomplete
    @result = User.search(params[:query], fields: [{username: :autocomplete}], limit: 10).map(&:username)
    render json: @result
  end

  def index
    if params[:query].present?
      @users = User.search(params[:query])
    else
      @users = User.all
    end
  end

  def dashboard
    render :welcome_page unless current_user
  end

  def dashboard_admin
    if current_user.is_admin?
      get_user_info(User.find_by(id: params[:id]))
      render 'dashboard'
    elsif current_user.is_admin?
      flash[:notice] = "You are unauthorized to view other user's dashboards"
      redirect_to '/'
    end
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
      @already_deleted_flag = user.deleted? #used to check if the user is already deleted before an admin visited the a user's edit page
      user.update(user_params)
      UserMailer.account_deleted(@user) if user.deleted? && !@already_deleted_flag
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
      @teachable_objects = user.teachable_skills
      @learnable_objects = user.learnable_skills
      @learnables = user.learnable_skills.map &:name 
      @teachables = user.teachable_skills.map &:name
      @user = user
    end
  end

  def user
    User.find_by(id: params[:id])
  end    

end
