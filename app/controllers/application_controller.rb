class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters               
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :current_password, :avatar, :name, :bio)
    end
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up,  keys: [:name, :password, :password_confirmation])
  end
end
