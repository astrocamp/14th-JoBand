# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_paranoid

  # associations
  belongs_to :user
end
