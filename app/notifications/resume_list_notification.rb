# frozen_string_literal: true

# To deliver this notification:
#
# ResumeListNotification.with(post: @post).deliver_later(current_user)
# ResumeListNotification.with(post: @post).deliver(current_user)

class ResumeListNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    t("notice.resume_list.message")
  end

  def url
    resume_list_path(params[:ResumeList])
  end
end
