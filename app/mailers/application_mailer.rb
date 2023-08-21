# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'support@joband.co'
  layout 'mailer'
end
