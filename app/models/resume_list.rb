# frozen_string_literal: true

class ResumeList < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :recruit
  has_many :comments, as: :commentable

  after_create_commit :notify_recipient

  before_destroy :cleanup_notifications
  
  has_noticed_notifications model_name: 'Notification'

  # enum
  enum status: {
    pending: 0,
    approved: 1,
    rejected: 2
  }, _prefix: true

  def band_leader
    self.recruit.band.band_members.leader.take.user
  end

  private
  
  # 通知寄給創建招募的人
  def notify_recipient
    band_leader = recruit.band.band_members.leader.take.user
    ResumeListNotification.with(ResumeList: self.id).deliver(band_leader)
  end

  def cleanup_notifications
    Notification.find_by("params->>'ResumeList'  = ?", "#{self.id}" ).destroy
  end
end
