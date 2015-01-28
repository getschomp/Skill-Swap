class WantedSkillsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :get_wanted_skill, only: [:show, :edit, :update, :destroy]
  before_action :get_user, only: [:new, :create]

  def get_wanted_skill
    @wanted_skill = WantedSkill.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def show
  end

  def new
    @wanted_skill = WantedSkill.new
    user_not_authorized
  end

  def create
    skill_name = titleize(params[:wanted_skill][:skill_attributes][:name])
    @user = User.find(params[:user_id])
    @skill = Skill.find_or_create_by(name: skill_name)
    @wanted_skill = WantedSkill.new(wanted_skill_params)
    @wanted_skill.skill_id = @skill.id
    @wanted_skill.user_id = @user.id
    if @user == current_user
      if @wanted_skill.save
        name = @wanted_skill.skill.name
        success = "Good! You've sucessfully added the skill: #{name}" + "
        to the list of skills you want to learn."
        redirect_to user_path(current_user), notice: success
      else
        error = "Error: The skill name was blank," +
                " or you already added that skill"
        redirect_to new_user_wanted_skill_path(@user), notice: error
      end
    end
    user_not_authorized
  end

  def destroy
    @user = User.find(params[:user_id])
    @wanted_skill.destroy
    redirect_to user_path(@user), notice: "Skill successfully deleted from profile."
  end

  private
  def wanted_skill_params
    params.require(:wanted_skill).permit(:skill_id, :user_id, :current_level, :teachers_skill, :why_description,
    skill_attributes: [:name])
  end
end
