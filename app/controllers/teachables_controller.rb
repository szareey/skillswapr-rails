class TeachablesController < ApplicationController
  
  byebug

  def create

    if params[:add_teachable] != "" 
      unless skill = Skill.find_by(name: params[:add_teachable])
        skill = Skill.create(name: params[:add_teachable])
      end      
      Teachable.create(user: current_user, skill: skill)
    end

  end

end