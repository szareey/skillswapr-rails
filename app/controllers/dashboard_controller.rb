class DashboardController < ApplicationController
  
  before_filter :list_skills

  def show
    render :welcome unless current_user
  end

  def edit
    list_skills
  end

  def update
  end

  def destory
  end

  protected


end
