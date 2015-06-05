class TeachablesController < ApplicationController
  


  def create

    if params[:add_teachable] != "" 
      unless skill = Skill.find_by(name: params[:add_teachable])
        skill = Skill.create(name: params[:add_teachable])
      end      
      Teachable.create(user_id: params[:user_id], skill: skill)  
    end

    redirect_to 'edit'
  end

  def destroy

    Teachable.find_by(skill_id: params[:teachable_id], user_id: params[:user_id]).destroy
    redirect_to 'edit'
    
  end

end