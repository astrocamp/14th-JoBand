# frozen_string_literal: true

class Band < ApplicationRecord
  validates :name, presence: true

  # associations
  has_rich_text :content
  has_one_attached :avatar
  has_one_attached :banner
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
    active: 0,      # 活躍中
    recruiting: 1,  # 招募中
    on_break: 2,    # 暫時休團
    disbanded: 3    # 解散
  }, _prefix: true

  enum area: {
    North: 0,
    Central: 1,
    South: 2,
    East: 3
  }, _prefix: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[area content name state]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[rich_text_content styles]
  end
end
