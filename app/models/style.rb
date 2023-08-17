class Style < ApplicationRecord
  has_many :band_styles
  has_many :bands, through: :band_styles
  
  validates :name, uniqueness: true
end
