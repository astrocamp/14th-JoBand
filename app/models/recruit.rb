# frozen_string_literal: true

class Recruit < ApplicationRecord
  validates :instrument_ids, presence: true

  # associations
  has_many :recruit_and_instrument
  has_many :instruments, through: :recruit_and_instrument, dependent: :destroy
  belongs_to :band
  has_many :resume_lists
  has_many :users, through: :resume_lists

  enum area: {
    north: 0,
    central: 1,
    south: 2,
    notrh: 3
  }, _prefix: true
end
