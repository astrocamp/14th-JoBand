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
    t(".message")
  end
  # def message
  #   @band = Band.find(params[:resume_list][:band_slug])
  #   @reseme_list = ResumeList.find(params[:resume_list][:id])
  #   @user = User.find(@reseme_list.user_id)

  #   email_username = @user.email.split('@').first

  #   "#{email_username} 申請加入 #{@recruit.title.truncate(10)}"
    
  # end
  #
  def url
    recruit_path(params[:band].recruit)
  end
  # def url
  #   band_path(Band.find(params[:resume_list][:band_slug]))
  # end


  # def url
  #   article_path(Article.find(params[:comment][:article_id]))
  # end
end
