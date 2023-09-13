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
    t('.message')
  end

  def url
    resume_list_path(params[:ResumeList])
  end
  
  # def url
  #   band_path(Band.find(params[:resume_list][:band_slug]))
  # end

  # def url
  #   article_path(Article.find(params[:comment][:article_id]))
  # end
end
