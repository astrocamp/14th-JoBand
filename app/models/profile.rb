# frozen_string_literal: true

class Profile < ApplicationRecord
  # validates
  # validates :phone, presence: true

  # associations
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
  has_one_attached :music
  has_one_attached :video
  has_many :profile_and_instrument
  has_many :instruments, through: :profile_and_instrument
  has_many :band_members
  has_many :bands, through: :band_members
  belongs_to :user

  enum seniority: {
    '1年以下': 0,
    '1 - 3年': 1,
    '3 - 5年': 2,
    '5 - 10年': 3,
    '10 - 15年': 4,
    '15 - 20年': 5,
    '20年以上': 6
  }, _prefix: true

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
