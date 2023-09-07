# frozen_string_literal: true

class Activity < ApplicationRecord
  validates :title, :content, :location, :time_start, :time_end, presence: true

  # associations
  has_one_attached :banner do |attachable|
    attachable.variant :thumb, resize_to_limit: [800, 800]
  end
  has_many :comments, as: :commentable
  belongs_to :band

  enum city: {
    基隆市: 0,
    臺北市: 1,
    新北市: 2,
    桃園市: 3,
    新竹縣: 4,
    新竹市: 5,
    苗栗縣: 6,
    苗栗市: 7,
    臺中市: 8,
    南投縣: 9,
    南投市: 10,
    彰化縣: 11,
    彰化市: 12,
    雲林縣: 13,
    嘉義縣: 14,
    嘉義市: 15,
    臺南市: 16,
    高雄市: 17,
    宜蘭縣: 18,
    宜蘭市: 19,
    花蓮縣: 20,
    花蓮市: 21,
    屏東縣: 22,
    屏東市: 23,
    臺東縣: 24,
    臺東市: 25,
    澎湖縣: 26,
    金門縣: 27,
    連江縣: 28
  }, _prefix: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[title content name]
  end
  def self.ransackable_associations(_auth_object = nil)
    %w[band]
  end
end
