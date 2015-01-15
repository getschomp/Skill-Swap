class HadSkillsController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update]

  def get_user
  end

  def edit

  end

  def update

  end

  private
  def user_params
    params.require(:had_skill).permit(:skill_id, :user_id, :expertise_level, :experience)
  end

end
