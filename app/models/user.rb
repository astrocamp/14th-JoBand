# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  # validates
  validates :password, presence: true, length: { in: 8..16 }
  validates :email, presence: true, format: { with: Devise.email_regexp }

  # associations
  has_one :profile
  has_many :band_members
  has_many :bands, through: :band_members
  has_many :resume_lists
  has_many :recruits, through: :resume_lists

  # ransack
  def self.ransackable_attributes(_auth_object = nil)
    ['name']
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[band_members bands profile]
  end
  
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    # Uncomment the section below if you want users to be created if they don't exist
    user ||= User.create(
      email: data['email'],
      name: data['name'] || data['email'].split('@').first,
      password: Devise.friendly_token[0, 16]
    )
    user
  end
  
end
