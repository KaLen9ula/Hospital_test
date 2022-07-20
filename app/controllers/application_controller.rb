class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_num, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,keys:[:first_name, :last_name, :avatar, :email])
  end
end
