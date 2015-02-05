class SkillsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]
  autocomplete :skill, :name
  before_action :get_skill, only: [:edit, :update, :destoy, :show]

  def get_skill
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    #TODO: what happens if there is no current_user? There should be behavior
    # for that use case
    if current_user
      if @skill.save
       redirect_to skill_path(@skill), notice: "Skill sucessfully created!"
      else
        render "new"
      end
    end
  end

  def edit
  end

  def update
    @skill.update(skill_params)
    if  @skill.save
      redirect_to @skill, notice: 'Skill was sucessfully edited'
    else
      render :edit
    end
  end

  def index
    if params[:query]
      @skills = Skill.search(params[:query]).order('name ASC')
    else
      @skills = Skill.all.order('name ASC')
    end
    @skills = @skills.limit(10).page(params[:page])
  end

  def destroy
  # only accesible by admin
  # if current user is admin statement
  end

  def show
    id = params[:id]
    @skill = Skill.find(id)
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :category, :description, :url)
  end
end
