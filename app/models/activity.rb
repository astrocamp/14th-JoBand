# frozen_string_literal: true

class Activity < ApplicationRecord
  validates :title, :content, :location, presence: true

  # associations
  has_one_attached :banner
  has_many :comments, as: :commentable
  belongs_to :band
end
