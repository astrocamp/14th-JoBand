# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  # associations
  has_one :profile

  def self.find_for_google_oauth2(access_token, _signed_in_resource = nil)
    data = access_token.info
    user = User.where(google_token: access_token.credentials.token, google_uid: access_token.uid).first
    return user if user

    existing_user = User.where(email: data['email']).first
    if existing_user
      existing_user.google_uid = access_token.uid
      existing_user.google_token = access_token.credentials.token
      existing_user.save!
      existing_user
    else
      # Uncomment the section below if you want users to be created if they don't exist
      User.create(
        name: data['name'],
        email: data['email'],
        password: Devise.friendly_token[0, 20],
        google_token: access_token.credentials.token,
        google_uid: access_token.uid
      )
    end
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid(auth.uid)
    if user
      user.fb_token = auth.credentials.token
      user.save!
      return user
    end
    # Case 2: Find existing user by email
    existing_user = User.find_by_email(auth.info.email)
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      existing_user.save!
      return existing_user
    end
    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.name = auth.info.name
    user.save!
    user
  end
end
