class Channel < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :band
  has_many :posts
  has_many :like_logs, dependent: :destroy
  has_many :users, through: :like_logs
end
