# frozen_string_literal: true

class Profile < ApplicationRecord
  # validates
  # validates :phone, presence: true

  # associations
  has_one_attached :avatar
  has_one_attached :music
  has_one_attached :video
  has_many :profile_and_instrument
  has_many :instruments, through: :profile_and_instrument
  has_many :band_members
  has_many :bands, through: :band_members
  belongs_to :user

  def default_instrument(profile)
    if profile.instruments.present?
      instruments.first.name
    else
      'listener'
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[content location name seniority]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[band_members bands instruments profile_and_instrument user]
  end
end
