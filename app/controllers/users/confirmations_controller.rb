# frozen_string_literal: true

module Users
  class ConfirmationsController < Devise::ConfirmationsController
    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(_resource_name)
      sign_in(resource)
      letsjam_profile_path(resource)
    end

    # The path used after confirmation.
    def after_confirmation_path_for(_resource_name, resource)
      sign_in(resource)
      letsjam_profile_path(resource)
    end
  end
end
