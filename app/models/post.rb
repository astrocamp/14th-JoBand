# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_paranoid
  validates :body, length: { maximum: 240 }, allow_blank: false

  # associations
  belongs_to :user
  belongs_to :channel, optional: true
  has_many :like_logs, dependent: :destroy
  has_many :users, through: :like_logs
  has_many :comments, -> { order(created_at: :desc) }, as: :commentable
end
