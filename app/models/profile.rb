class Profile < ApplicationRecord
  has_many :instruments
  accepts_nested_attributes_for :instruments, allow_destroy: true
end
