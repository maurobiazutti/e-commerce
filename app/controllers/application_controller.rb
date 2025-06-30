class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:name, :phone, :email, :password, :password_confirmation)
      end

      # devise_parameter_sanitizer.permit(:account_update) do |u|
      #   u.permit(:name, :phone, :email, :password, :current_password)
      # end
    end
end
