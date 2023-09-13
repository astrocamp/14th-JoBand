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

  private

  # 通知寄給創建招募的人
  def notify_recipient
    band_leader = recruit.band.band_members.leader.take.user

    return if band_leader == user

    ResumeListNotification.with(ResumeList: self, band: recruit.band).deliver_later(band_leader)
  end

  def cleanup_notifications
    notifications_as_resume_list.destroy_all
  end
end
