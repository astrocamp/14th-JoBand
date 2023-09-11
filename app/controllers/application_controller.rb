# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  around_action :switch_locale
  before_action :set_notifications, if: :current_user
  include Pundit::Authorization

  def user_not_authorized
    render file: Rails.root.join('public', '403.html'), status: 403, layout: false
  end

  def not_found
    render file: Rails.root.join('public', '404.html'), status: 404, layout: false
  end

  def switch_locale(&action)
    locale = session[:locale] || params[:locale] || I18n.default_locale
    locale = 'tw' unless I18n.available_locales.include?(locale.to_sym)
    I18n.with_locale(locale, &action) 
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_notifications
    notifications = Notification.includes(:recipient).where(recipient: current_user).newest_first.limit(5)
    @unread = notifications.unread
    @read = notifications.read
  end
end
