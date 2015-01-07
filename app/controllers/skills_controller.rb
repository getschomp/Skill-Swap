class SkillsController < ApplicationController
  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
     redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  def update
  end

  def destroy
  #only accesible by admin
  #if current user is admin statement
  end

  def show
    id = params[:id]
    @skill = Skill.find(id)
  end

  private
  def skill_params
    params.require(:skill).permit(:name, :category, :description, :url)
  end
end
