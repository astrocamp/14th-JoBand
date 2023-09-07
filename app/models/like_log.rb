class LikeLog < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
