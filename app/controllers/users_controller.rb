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
    WantedSkill.all.each do |wanted_skill|
      if wanted_skill.skill_id == had_skill_id
        users << wanted_skill.user
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
    if params[:sort]
      @had_skill_skill_id = params[:sort][:had_skill_skill_id].to_i
      @wanted_skill_skill_id = params[:sort][:wanted_skill_skill_id].to_i
    end
    if params[:query]
      @users = User.search(params[:query])
    elsif @had_skill_skill_id != nil && @wanted_skill_skill_id != nil
      @users = find_matching_had_wanted(@had_skill_skill_id, @wanted_skill_skill_id)
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @articles }
        format.js
      end
    elsif params[:miles] == 1
      @user = nearby_users
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @articles }
        format.js
      end
    elsif params[:miles] == 5
    elsif params[:miles] == 25
    else
      @users = User.order('created_at DESC')
    end
  end

  def edit
    if current_user != @user
      redirect_to @user, notice: "You're not authorized to edit this profile!"
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to @user, notice: "User Profile Updated"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :username, :email, :password,
    :gender, :about_me, :address, :page,
    wanted_skill_attributes: [:skill_id, :user_id, :current_level, :teachers_skill, :why_description],
    had_skill_attributes: [:skill_id, :user_id, :expertise_level, :experience])
  end
end
