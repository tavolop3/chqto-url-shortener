# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: %i[login password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def not_found
    render(file: File.join(Rails.root, 'public/404.html'), status: 404, layout: false)
  end

  def not_found_temporal
    render(file: File.join(Rails.root, 'public/404_temporal.html'), status: 404, layout: false)
  end

  def forbidden
    render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
  end
end
