# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :collection, :resource
  before_action :configure_permitted_params, if: :devise_controller?

  protected

  def configure_permitted_params
    keys = %i[username first_name last_name email]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
  end
end
