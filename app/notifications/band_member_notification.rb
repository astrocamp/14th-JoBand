# To deliver this notification:
#
# BandMemberNotification.with(post: @post).deliver_later(current_user)
# BandMemberNotification.with(post: @post).deliver(current_user)

class BandMemberNotification < Noticed::Base
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
    t(".message")
  end
  #
  def url
    band_path(params[:band])
  end
end
