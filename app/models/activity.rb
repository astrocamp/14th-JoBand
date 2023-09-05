# frozen_string_literal: true

class Activity < ApplicationRecord
  validates :title, :content, :location, presence: true

  # associations
  has_one_attached :banner
end
