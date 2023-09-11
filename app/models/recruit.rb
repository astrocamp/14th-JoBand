# frozen_string_literal: true

class Recruit < ApplicationRecord
  validates :instrument_ids, presence: true

  # associations
  has_many :recruit_and_instrument
  has_many :instruments, through: :recruit_and_instrument, dependent: :destroy
  belongs_to :band
  has_many :resume_lists, dependent: :destroy
  has_many :users, through: :resume_lists

  enum area: {
    臺北市: 0,
    新北市: 1,
    基隆市: 2,
    桃園市: 3,
    新竹市: 4,
    新竹縣: 5,
    苗栗縣: 6,
    臺中市: 7,
    彰化縣: 8,
    南投縣: 9,
    雲林縣: 10,
    嘉義市: 11,
    嘉義縣: 12,
    臺南市: 13,
    高雄市: 14,
    屏東縣: 15,
    宜蘭縣: 16,
    花蓮縣: 17,
    臺東縣: 18,
    澎湖縣: 19,
    金門縣: 20,
    連江縣: 21
  }, _prefix: true
end
