class SkillsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]
  autocomplete :skill, :name

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if current_user
      if @skill.save
       redirect_to skill_path(@skill), notice: "Skill sucessfully created!"
      else
        render "new"
      end
    end
  end

  def edit

  end

  def update
    @skill.update(skill_params)
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
