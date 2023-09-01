class Activity < ApplicationRecord
  validates :title, :content, :location, presence: true

  # associations
  has_one_attached :activity_banner
end
