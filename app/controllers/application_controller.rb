class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :configure_sign_up_params, only: [:create]
  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up)  { |u| u.permit(  :username, :firstname, :lastname, :contact, :address, :email, :password, :password_confirmation, :provider, :uid) }
  end

  private
  def layout_by_resource
    if devise_controller?
      "weekendpro"
    else
      "application"
    end
  end

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
