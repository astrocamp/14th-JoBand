# frozen_string_literal: true

class Band < ApplicationRecord
  # friendly_id
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: true

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

  # enum
  enum state: {
    活躍中: 0,
    暫時休團: 1,
    解散: 2
  }, _prefix: true

  enum area: {
    北部: 0,
    中部: 1,
    南部: 2,
    東部: 3
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
end
