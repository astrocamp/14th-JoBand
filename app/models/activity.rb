class Activity < ApplicationRecord
  validates :title, :content, :location, presence: true

  # associations
  belongs_to :band
end
