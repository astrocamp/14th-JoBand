class Profile < ApplicationRecord

  # validates
  validates :name, presence: true
  validates :phone, presence: true
  
  
  # associations
  has_one_attached :avatar
  has_many :instruments
  accepts_nested_attributes_for :instruments, allow_destroy: true
  
end
