class UserssController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :gender, :about_me)
  end
end
