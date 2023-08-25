class ResumeList < ApplicationRecord
  belongs_to :user
  belongs_to :recruit


  # enum
  enum status: {
    pending: 0,      # 未申請
    approved: 1,  # 申請通過
    rejected: 2,    # 申請被拒絕
  }, _prefix: true
  
end
