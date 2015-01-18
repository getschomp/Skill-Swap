class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  def titleize(string)
    lowercase_words = %w{a an the and but or for nor of}
    string.split.each_with_index.map { |x, index| lowercase_words.include?(x) && index > 0 ? x : x.capitalize }.join(" ")
  end

  def user_not_authorized
    if @user != current_user
      message = "You are not authorized."
      redirect_to root_path, notice: message
    end
  end

  protected

  def configure_devise_permitted_parameters
    registration_params = [:username, :email, :password, :password_confirmation]

    if params[:action] == "update"
      devise_parameter_sanitizer.for(:account_update) do
        |u| u.permit(registration_params << :current_password)
        end
    elsif params[:action] == "create"
      devise_parameter_sanitizer.for(:sign_up) do
       |u| u.permit(registration_params)
    end
    end
  end
end
