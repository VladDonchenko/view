class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:description])
    devise_parameter_sanitizer.permit(:account_create, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_create, keys: [:last_name])
  end

  def current_order
    Order.find_or_create_by(user: current_user)
  end
end
