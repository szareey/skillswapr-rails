class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def list_skills
      @learnables = current_user.learnable_skills.map &:name 
      @teachables = current_user.teachable_skills.map &:name
    end

    helper_method :current_user, :list_skills

end
