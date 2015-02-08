class UserSkillsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :get_user_skill, only: [:show, :edit, :update, :destroy]
  before_action :get_user, only: [:new, :create]

  def get_user_skill
    @user_skill = UserSkill.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def new
    @user_skill = UserSkill.new
    user_not_authorized
  end

  def create
    skill_name = titleize(params[:user_skill][:skill_attributes][:name])
    @skill = Skill.find_or_create_by(name: skill_name)
    @user_skill = UserSkill.new(user_skill_params)
    @user_skill.skill_id = @skill.id
    @user_skill.user_id = @user.id
    if @user == current_user
      if @user_skill.save
        name = @user_skill.skill.name
        success = "Good! You've sucessfully added the skill: #{name}" + "
        to the list of skills you want to learn."
        redirect_to user_path(current_user), notice: success
      else
        error = "Error: The skill name was blank," +
                " or you already added that skill"
        redirect_to new_user_user_skill_path(@user), notice: error
      end
    end
    user_not_authorized
  end

  # To Do add edit/update

  def destroy
    @user = User.find(params[:user_id])
    @user_skill.destroy
    redirect_to user_path(@user), notice: "Skill successfully deleted from profile."
  end

  private

  def user_skill_params
    params.require(:user_skill).permit(:skill_id, :user_id, :known?, :skill_level, :description,
    skill_attributes: [:name])
  end

end
