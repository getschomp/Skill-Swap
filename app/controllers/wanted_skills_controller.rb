class WantedSkillController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :get_wanted_skill, only: [:show, :edit, :update]

  def get_wanted_skill
    @wanted_skill = WantedSkill.find(params[:id])
  end

  def show
  end

  def new
    @wanted_skill = WantedSkill.new
  end

  def create
    @wanted_skill = WantedSkill.new(wanted_skill_params)
    if @wanted_skill.save
      redirect_to user_path(current_user), notice: "Good!  You've sucessfully added the skill: #{@wanted_skill.skill.name} to the list of skills you want to learn."
    else
      render :new
    end
  end

  def edit
    @wanted_skill = WantedSkill.create(wanted_skill_params)
    if current_user
      if current_user.id != @user.id
        redirect_to @user, notice: "You're not authorized to edit this profile!"
      end
    else
      redirect_to @user, notice: "You're not authorized to edit this profile!"
    end
  end

  def update
    @wanted_skill.update(wanted_skill_params)
    if(@wanted.save
      redirect_to @wanted_skill, notice:"User Profile Updated")
    else
      render :edit
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private
  def wanted_skill_params
    params.require(:wanted_skill).permit(:skill_id, :user_id, :current_level, :teachers_skill, :why_description)
  end
end
