# frozen_string_literal: true

class Profile < ApplicationRecord
  # validates
  validates :name, presence: true
  validates :phone, presence: true

  # associations
  has_one_attached :avatar
  has_one_attached :music
  has_one_attached :video
  has_many :profile_and_instrument
  has_many :instruments, through: :profile_and_instrument
end
