class Activity < ApplicationRecord
  validates :title, :content, :location, presence: true
end
