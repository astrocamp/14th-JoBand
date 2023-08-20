# frozen_string_literal: true

class Style < ApplicationRecord
  has_many :band_styles
  has_many :bands, through: :band_styles

  validates :name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
