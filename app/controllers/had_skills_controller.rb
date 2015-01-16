class HadSkillsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :had_skill, only: [:show, :edit, :update]
  before_action :get_user, only: [:new, :create]

  # move to model?
  def titleize(string)
    lowercase_words = %w{a an the and but or for nor of}
    string.split.each_with_index.map{|x, index| lowercase_words.include?(x) && index > 0 ? x : x.capitalize }.join(" ")
  end

  def get_had_skill
    @had_skill = HadSkill.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @had_skill = HadSkill.new
  end

  def create
    #check for current user
    skill_name = titleize(params[:had_skill][:skill_attributes][:name])
    @user = User.find(params[:user_id])
    @skill = Skill.find_or_create_by(name: skill_name)
    @had_skill = HadSkill.new(had_skill_params)
    @had_skill.skill_id = @skill.id
    @had_skill.user_id = @user.id
    if current_user
      if @user = current_user
        if @had_skill.save
          redirect_to user_path(current_user), notice: "Good!  You've sucessfully added the skill: #{@had_skill.skill.name} to the list of skills you want to learn."
        else
          redirect_to new_user_had_skill_path(@user), notice:"Error: Skill name can't be blank"
        end
      else
        redirect_to root_path, notice: "You are not authorized to edit this page."
      end
    end
  end

  # def edit
  #   # @had_skill = HadSkill.create(had_skill_params)
  #   # if current_user
  #   #   if current_user.id != @user.id
  #   #     redirect_to @user, notice: "You're not authorized to edit this profile!"
  #   #   end
  #   # else
  #   #   redirect_to @user, notice: "You're not authorized to edit this profile!"
  #   # end
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

  # Never trust parameters from the scary internet, only allow the white list through.
  private
  def had_skill_params
    params.require(:had_skill).permit(:skill_id, :user_id, :expertise_level, :experience,
    skill_attributes: [:name])
  end
end
