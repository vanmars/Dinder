class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters               
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :avatar, :name)
    end

    devise_parameter_sanitizer.permit(:sign_up,  keys: [:name])
  end

end
