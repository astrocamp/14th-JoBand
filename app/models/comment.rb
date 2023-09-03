# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to :user
  acts_as_paranoid 
end
