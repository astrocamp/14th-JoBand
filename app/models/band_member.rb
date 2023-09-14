# frozen_string_literal: true

class BandMember < ApplicationRecord
  belongs_to :user
  belongs_to :band

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  def notify_recipient
    
    new_member = self.user

    return if new_member == user

    BandMemberNotification.with(BandMember: self.id, band: self.band).deliver_later(new_member)
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
