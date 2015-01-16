class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update]

  def get_user
    @user = User.find(params[:id])
  end

  def index
    @users = User.limit(10).page(params[:page])
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    if current_user
      if current_user.id != @user.id
        redirect_to @user, notice: "You're not authorized to edit this profile!"
      end
    else
      redirect_to @user, notice: "You're not authorized to edit this profile!"
    end
  end

  def update
    # @wanted_skill = WantedSkill.find(params[:users][:wanted_skill_sttributes][:skill_id])
    # @wanted_skill.update(user_params)
    # if(@wanted_skill.save
    #   redirect_to @wanted_skill, notice:"User Profile Updated")
    # else
    #   render :edit
    # end
    @user.update(user_params)
    if(@user.save
      redirect_to @user, notice:"User Profile Updated")
    else
      render :edit
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private
  def user_params
    params.require(:user).permit(:id, :username, :email, :password, :gender, :about_me, :location_id, :page,
    wanted_skill_attributes: [:skill_id, :user_id, :current_level, :teachers_skill, :why_description],
    had_skill_attributes: [:skill_id, :user_id, :expertise_level, :experience])
  end
end
