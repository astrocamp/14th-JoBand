class Band < ApplicationRecord
  validates :name ,presence: true

  has_many :band_styles
  has_many :styles, through: :band_styles

  enum state: {
    active: 0,      # 活躍中
    recruiting: 1,  # 招募中
    on_break: 2,    # 暫時休團
    disbanded: 3    # 解散

  enum state: {
    active: 0,          # 活躍中
    recruiting: 1,      # 招募中
    on_break: 2,        # 暫時休團
    disbanded: 3        # 解散

end
