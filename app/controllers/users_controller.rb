class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]
  before_action :get_user, only: [:show, :edit, :update]

  def get_user
    @user = User.find(params[:id])
  end

  def index
    if params[:query]
      @users = User.search(params[:query]).page params[:page]
    elsif params[:sort]
      @had_skill_id = params[:sort][:had_skill_id]
      @wanted_skill_id = params[:sort][:wanted_skill_id]
      @miles = params[:sort][:miles].to_f

      @had_skill = HadSkill.find_by(skill_id: @had_skill_id)
      @wanted_skill = WantedSkill.find_by(skill_id: @wanted_skill_id)

      @users = @had_skill.find_matching_users & @wanted_skill.find_matching_users
      @users = Kaminari.paginate_array(@users).page(params[:page])
      @description = "Users who know #{Skill.find(@had_skill_id).name}" +
                     " and want to know #{Skill.find(@wanted_skill_id).name}:" +
                    "#{@users.size} users match this combination of skills"

      if @miles != ""
        @users = User.find_by_distance(@miles, @users, current_user)
        @users = Kaminari.paginate_array(@users).page(params[:page])
      end
    else
      @users = User.order('created_at DESC').page params[:page]
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
                                  :gender, :about_me, :address, :page)
  end
end
