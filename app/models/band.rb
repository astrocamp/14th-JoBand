class Band < ApplicationRecord
  # validates
  validates :name ,presence: true

  # associations
  has_one_attached :avatar
  has_many :band_styles
  has_many :styles, through: :band_styles

  # enum
  enum state: {
    active: 0,      # 活躍中
    recruiting: 1,  # 招募中
    on_break: 2,    # 暫時休團
    disbanded: 3    # 解散
  }, _prefix: true

  enum area: {
    North: 0,
    Central: 1,
    South: 2,
    East: 3,
  }, _prefix: true
  
end
