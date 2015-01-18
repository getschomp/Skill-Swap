class HadSkillsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,
                                            :edit, :update, :destroy]
  before_action :get_had_skill, only: [:show, :edit, :update, :destroy]
  before_action :get_user, only: [:new, :create, :edit]

  def get_had_skill
    @had_skill = HadSkill.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def show
  end

  def new
    @had_skill = HadSkill.new
    user_not_authorized
  end

  def create
    skill_name = titleize(params[:had_skill][:skill_attributes][:name])
    @skill = Skill.find_or_create_by(name: skill_name)
    @had_skill = HadSkill.new(had_skill_params)
    @had_skill.skill_id = @skill.id
    @had_skill.user_id = @user.id
    if @user == current_user
      if @had_skill.save
        success = "Good! You've sucessfully added the skill:" +
                  "#{@had_skill.skill.name} to the list of skills" +
                  "you want to learn."
        redirect_to user_path(current_user), notice: success
      else
        error = "Error: The skill name was blank," +
        " or you already added that skill"
        redirect_to new_user_had_skill_path(@user), notice: error
      end
    end
    user_not_authorized
  end

  # def edit
  #   if @user == current_user
  #     if @had_skill.save
  #       success = "Good! You've sucessfully added the skill: #{@had_skill.skill.name} to the list of skills you want to learn."
  #       redirect_to user_path(current_user), notice: success
  #     else
  #       error = "Error: Skill name can't be blank"
  #       redirect_to new_user_had_skill_path(@user), notice: error
  #     end
  #   else
  #     not_authorized
  #   end
  # end
  #
  # def update
  #   # @had_skill.update(had_skill_params)
  #   # if @had_skill.save
  #   #   redirect_to @had_skill, notice:"User Profile Updated")
  #   # else
  #   #   render :edit
  #   # end
  # end

  def destroy
    @user = User.find(params[:user_id])
    @had_skill.destroy
    redirect_to user_path(@user), notice: "Skill successfully deleted from profile."
  end

  private

  def had_skill_params
    params.require(:had_skill).permit(:skill_id, :user_id,
    :expertise_level, :experience, skill_attributes: [:name])
  end
end
