class ResumeList < ApplicationRecord
  belongs_to :user
  belongs_to :recruit


  # enum
  enum status: {
    pending: 0,      # 未申請
    approved: 1,  # 申請通過
    rejected: 2,    # 申請被拒絕
  }, _prefix: true
  
  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= :pending
  end
end
