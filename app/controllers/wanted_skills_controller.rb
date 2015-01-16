class WantedSkillsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :get_wanted_skill, only: [:show, :edit, :update]
  before_action :get_user, only: [:new, :create]

  # move to model?
  def titleize(string)
    lowercase_words = %w{a an the and but or for nor of}
    string.split.each_with_index.map{|x, index| lowercase_words.include?(x) && index > 0 ? x : x.capitalize }.join(" ")
  end

  def get_wanted_skill
    @wanted_skill = WantedSkill.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @wanted_skill = WantedSkill.new
  end

  def create
    skill_name = titleize(params[:wanted_skill][:skill_attributes][:name])
    @user = User.find(params[:user_id])
    @skill = Skill.find_or_create_by(name: skill_name)
    @wanted_skill = WantedSkill.new(wanted_skill_params)
    @wanted_skill.skill_id = @skill.id
    @wanted_skill.user_id = @user.id
    if current_user
      if @user = current_user
        if @wanted_skill.save
          redirect_to user_path(current_user), notice: "Good!  You've sucessfully added the skill: #{@wanted_skill.skill.name} to the list of skills you want to learn."
        else
          redirect_to new_user_wanted_skill_path(@user), notice:"Error: Skill name can't be blank"
        end
      else
        redirect_to root_path, notice: "You are not authorized to edit this page."
      end
    end
  end

  # def edit
  #   @wanted_skill = WantedSkill.create(wanted_skill_params)
  #   if current_user
  #     if current_user.id != @user.id
  #       redirect_to @user, notice: "You're not authorized to edit this profile!"
  #     end
  #   else
  #     redirect_to @user, notice: "You're not authorized to edit this profile!"
  #   end
  # end
  #
  # def update
  #   @wanted_skill.update(wanted_skill_params)
  #   if(@wanted.save
  #     redirect_to @wanted_skill, notice:"User Profile Updated")
  #   else
  #     render :edit
  #   end
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  private
  def wanted_skill_params
    params.require(:wanted_skill).permit(:skill_id, :user_id, :current_level, :teachers_skill, :why_description,
    skill_attributes: [:name])
  end
end
