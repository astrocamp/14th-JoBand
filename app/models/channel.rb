class Channel < ApplicationRecord
  belongs_to :user
  belongs_to :band
  has_many :posts
end
