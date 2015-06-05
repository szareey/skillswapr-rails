class LearnablesController < ApplicationController
 
  def create

   if params[:add_learnable] != "" 
      unless skill = Skill.find_by(name: params[:add_learnable])
        skill = Skill.create(name: params[:add_learnable])
      end      
      Learnable.create(user_id: params[:user_id], skill: skill)
    end
    redirect_to 'edit'
  end

  def destroy
    Learnable.find_by(skill_id: params[:learnable_id], user_id: params[:user_id]).destroy
    redirect_to 'edit'
  end


end
