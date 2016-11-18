class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # before_filter :set_time_zone, if: :user_signed_in?

protected
  # def devise_parameter_sanitizer
  #   if resource_class == User
  #     User::ParameterSanitizer.new(User, :user, params)
  #   else
  #     super # Use the default one
  #   end
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name)
    end
  end

private
  def set_time_zone
    # Not Implemented
    Time.zone = current_user.time_zone
  end
end
