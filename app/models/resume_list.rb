# frozen_string_literal: true

class ResumeList < ApplicationRecord
  belongs_to :user
  belongs_to :recruit
  has_many :comments, as: :commentable

  validates :user_id, uniqueness: true

  # enum
  enum status: {
    pending: 0,
    approved: 1,
    rejected: 2
  }, _prefix: true
end
