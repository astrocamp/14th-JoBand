# frozen_string_literal: true

class Band < ApplicationRecord
  # friendly_id
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :style_ids, presence: true
  validates :name, presence: true, uniqueness: true
  validate :avatar_size
  validate :banner_size
  validate :music_size
  validate :video_size

  # associations
  has_rich_text :content
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
  has_one_attached :banner do |attachable|
    attachable.variant :thumb, resize_to_limit: [800, 800]
  end
  has_one_attached :music
  has_one_attached :video
  has_many :band_styles
  has_many :styles, through: :band_styles
  has_many :band_members
  has_many :users, through: :band_members
  has_one :recruit
  has_many :activities
  has_many :orders

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user

  # enum
  enum state: {
    活躍: 0,
    招募: 1,
    休團: 2,
    解散: 3
  }, _prefix: true

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

  def self.ransackable_attributes(_auth_object = nil)
    %w[area content name state]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[rich_text_content styles]
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  private

  def avatar_size
    if avatar.attached? && avatar.blob.byte_size > 3.megabytes
      return errors.add(:avatar, "不能大於3MB")
    end
  end

  def banner_size
    if banner.attached? && banner.blob.byte_size > 5.megabytes
      return errors.add(:banner, "不能大於5MB")
    end
  end

  def music_size
    if music.attached? && music.byte_size > 10.megabytes
      errors.add(:music, "不能大於10MB")
    end
  end

  def video_size
    if video.attached? && video.byte_size > 20.megabytes
      errors.add(:video, "不能大於20MB")
    end
  end
end
