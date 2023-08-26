# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    # The path used after sign up.
    def after_sign_up_path_for(_resource)
      welcome_profile_path
    end

    # The path used after sign up for inactive accounts.
    def after_inactive_sign_up_path_for(resource)
      welcome_profile_path(id: resource.id, locale: params[:locale])
    end
  end
end
