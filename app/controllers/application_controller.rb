# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render file: Rails.root.join('public', '404.html'), status: 404, layout: false
  end
end
