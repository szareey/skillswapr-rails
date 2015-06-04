class DashboardController < ApplicationController
  
  before_filter do
    list_skills(current_user)
  end

  def show
    render :welcome unless current_user
  end

  def edit
  end

  def update
  end

  def destory
  end

end
