# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render file: Rails.root.join('public', '404.html'), status: 404, layout: false
  end
  

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
