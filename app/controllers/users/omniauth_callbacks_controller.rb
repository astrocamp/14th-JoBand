# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # callback for google
    def google_oauth2
      callback_for(:google)
    end

    # common callback method
    def callback_for(provider)
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: provider
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.auth_data'] = request.env['omniauth.auth'].except('extra')
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    end

    def failure
      redirect_to root_path, notice: '驗證失敗'
    end
  end
end
