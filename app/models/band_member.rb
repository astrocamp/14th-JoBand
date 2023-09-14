# frozen_string_literal: true

class BandMember < ApplicationRecord
  belongs_to :user
  belongs_to :band

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'


  def notify_recipient
    new_member = self.user
    BandMemberNotification.with(BandMember: self.id, Band: self.band.id).deliver(new_member)
  end

  # def new_member
  #   self.user
  # end


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
