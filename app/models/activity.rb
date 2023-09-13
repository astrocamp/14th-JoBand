# frozen_string_literal: true

class Activity < ApplicationRecord
  validates :title, :content, :begin_at, :time_start, :time_end, :location, presence: true
  validate :start_time_must_be_before_end_time
  validate :banner_size

  # associations
  has_one_attached :banner do |attachable|
    attachable.variant :thumb, resize_to_limit: [800, 800]
  end
  has_many :comments, as: :commentable
  belongs_to :band

  enum city: {
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

  def self.ransackable_attributes(_auth_object = nil)
    %w[title content name]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[band]
  end

  private

  def start_time_must_be_before_end_time
    return unless time_end <= time_start
    errors.add(:base, '開始時間必須早於結束時間')
  end

  def banner_size
    if banner.attached? && banner.blob.byte_size > 10.megabytes
      return errors.add(:banner, "不能大於10MB")
    end
  end
end
