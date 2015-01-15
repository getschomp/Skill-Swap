class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update]

  def get_user
    @user = User.find(params[:id])
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    3.times { @user.wanted_skills.build}
    if current_user
      if current_user.id != @user.id
        redirect_to @user, notice: "You're not authorized to edit this profile!"
      end
    else
      redirect_to @user, notice: "You're not authorized to edit this profile!"
    end
  end

  def update
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
    params.require(:user).permit(:id, :username, :email, :password, :gender, :about_me, :location_id,
    wanted_skill_attributes: [:skill_id, :user_id, :current_level, :teachers_skill, :why_description] )
  end
end
