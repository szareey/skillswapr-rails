class LearnablesController < ApplicationController
 
  def create

   if params[:add_learnable] != "" 
      unless skill = Skill.find_by(name: params[:add_learnable])
        skill = Skill.create(name: params[:add_learnable])
      end      
      Learnable.create(user: current_user, skill: skill)
    end
  end

end