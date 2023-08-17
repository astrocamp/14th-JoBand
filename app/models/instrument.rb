# frozen_string_literal: true

class Instrument < ApplicationRecord
  # validates
  validates :name, uniqueness: true

  # associations
  has_many :profiles, through: :profile_and_instrument
  has_many :profile_and_instrument
  has_many :recruits, through: :recruit_and_instrument
  has_many :recruit_and_instrument
end
