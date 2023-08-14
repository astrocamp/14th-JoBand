class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers
  default template_path: 'users/mailer'

  def confirmation_instructions(record, token, opt={})
    headers["Custom-header"] = "Bar"
    opt[:subject] = "請驗證您的Email信箱"
    opt[:from] = "noreply@joband.co"
    opt[:reply_to] = "support@joband.co"
    super
  end

  def reset_password_instructions(record, token, opt={})
    headers["Custom-header"] = "Bar"
    opt[:subject] = "密碼重設步驟"
    opt[:from] = "noreply@joband.co"
    opt[:reply_to] = "support@joband.co"
    super
  end
end
