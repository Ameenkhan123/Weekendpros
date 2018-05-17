class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :configure_sign_up_params, only: [:create]
  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up)  { |u| u.permit(  :username, :firstname, :lastname, :contact, :address, :email, :password, :password_confirmation) }
  end

  private
  def layout_by_resource
    if devise_controller?
      "weekendpro"
    else
      "application"
    end
  end
end
