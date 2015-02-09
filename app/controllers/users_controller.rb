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
      @known_skill_id = params[:sort][:known_skill_id]
      @wanted_skill_id = params[:sort][:wanted_skill_id]
      @miles = params[:sort][:miles]
member do
get :retract
end
      @known_skill = HadSkill.find_by(skill_id: @had_skill_id)
      @wanted_skill = WantedSkill.find_by(skill_id: @wanted_skill_id)

      @users = @had_skill.find_matching_users & @wanted_skill.find_matching_users
      @num_users = @users.size
      @users = Kaminari.paginate_array(@users).page(params[:page]).per(15)
      @description1 = "Users who know #{Skill.find(@wanted_skill_id).name}" +
                     " and want to know #{Skill.find(@had_skill_id).name}:"
      @description2 = "#{@num_users} users match this combination of skills"
      if @miles != "" && @users
        @miles = @miles.to_i.to_f
        @users = User.find_by_distance(@miles, @users, current_user)
        @num_users = @users.size
        @users = Kaminari.paginate_array(@users).page(params[:page]).per(15)
        @description2 = "#{@num_users} users match this combination of skills within #{@miles.to_i} miles of you."
      end
    else
      @users = User.order('created_at DESC').page(params[:page]).per(15)
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
