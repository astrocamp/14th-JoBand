# frozen_string_literal: true

class BandMember < ApplicationRecord
  belongs_to :user
  belongs_to :band

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  def notify_recipient
    
    applyer = resume_list.user

    return if applyer == user

    BandMemberNotification.with(BandMember: self, resume_list: resume_list).deliver_later(applyer)
  end

  def cleanup_notifications
    notifications_as_resume_list.destroy_all
  end

  enum identity: %i[leader manager member]

  def self.default_roles
    %w[
      吉他手
      貝斯手
      主唱
      鼓手
      鍵盤手
    ]
  end
end
