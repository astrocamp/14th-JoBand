class Instrument < ApplicationRecord
  # validates
  validates :name, uniqueness: true

  # associations
  has_many :profiles, through: :profile_and_instrument
  has_many :profile_and_instrument
end
