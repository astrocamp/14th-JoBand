# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_paranoid

  # associations
  belongs_to :user
  has_many :like_logs
  has_many :users, through: :like_logs
end
