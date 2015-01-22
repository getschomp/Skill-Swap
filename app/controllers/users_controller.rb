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

  def find_by_distance(found_users, miles)
    users = []
    found_users.each do |user|
      distance = user.distance_to(current_user)
      if distance == miles
        users << user
      end
    end
    users
  end

  def nearby_users
    city = @user.address
    User.near(city)
  end

  def get_nearby_users(miles)

  end

  def get_user
    @user = User.find(params[:id])
  end

  def index

    if params[:query]
      @users = User.search(params[:query]).page params[:page]

    elsif params[:sort]
      @had_skill_id = params[:sort][:had_skill_skill_id].to_i
      @wanted_skill_id = params[:sort][:wanted_skill_skill_id].to_i
      @miles = params[:sort][:miles]

      @users = find_matching_had_wanted(@had_skill_id, @wanted_skill_id)
      @users = Kaminari.paginate_array(@users).page(params[:page])
      @description = "Users who know #{Skill.find(@had_skill_id).name}" +
                     " and want to know #{Skill.find(@wanted_skill_id).name}:"

      if @miles != ""
        if params[:miles] == 5

        end
        if params[:miles] == 10

        end
        if params[:miles] == 20
          
        end
        if params[:miles] == 60

        end
        if params[:miles] == 100

        end
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
