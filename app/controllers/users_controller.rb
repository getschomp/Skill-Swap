class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]
  before_action :get_user, only: [:show, :edit, :update]


  def find_matching_had(wanted_skill_id)
    users = []
    HadSkill.all.each do |had_skill|
      if had_skill.skill_id == wanted_skill_id
        users << had_skill.user
      end
    end
    users
  end

  def find_matching_wanted(had_skill_id)
    users = []
    HadSkill.all.each do |had_skill|
      if had_skill.skill_id == had_skill_id
        user << had_skill.user
      end
    end
    users
  end

  def find_matching_had_wanted(had_skill_id, wanted_skill_id)
    (find_matching_wanted(had_skill_id) & find_matching_had(wanted_skill_id))
  end

  # Make method return by miles.  Pass a default argument of 5 miles.
  def nearby_users
    city = @user.address
    User.near(city)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def index
    @users = User.limit(6).page(params[:page])
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    if current_user != @user
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
    if @user.save
      redirect_to @user, notice: "User Profile Updated"
    else
      render :edit
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private
  def user_params
    params.require(:user).permit(:id, :username, :email, :password,
    :gender, :about_me, :address, :page,
    wanted_skill_attributes: [:skill_id, :user_id, :current_level, :teachers_skill, :why_description],
    had_skill_attributes: [:skill_id, :user_id, :expertise_level, :experience])
  end
end
