# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  # associations
  has_one :profile
  has_many :band_members
  has_many :bands, through: :band_members

  # ransack
  def self.ransackable_attributes(_auth_object = nil)
    ['name']
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[band_members bands profile]
  end
  
  #第三方登入
  def self.from_omniauth(auth)
    data = auth.info
    user = User.where(email: data['email']).first
    
    user ||= User.create(
      email: data['email'],
      username: data['name'] || data['email'].split('@').first,
      password: Devise.friendly_token[0, 16]
    )
    user
  end
end
