class Band < ApplicationRecord
  validates :name ,presence: true

  has_many :band_styles
  has_many :styles, through: :band_styles
  # has_many :recruit

  enum state: {
    active: 0,          # 活躍中
    recruiting: 1,      # 招募中
    on_break: 2,        # 暫時休團
    disbanded: 3        # 解散
  }, _prefix: true

  enum area: {
    North: 0,
    Central: 1,
    South: 2,
    East: 3,
  },_prefix: true
  
    #表單序列化
    serialize :styles, Array  
    def self.styles
        [
        "Pop",
        "Folk",
        "Rock",
        "Hip-hop",
        "Metal",
        "Jazz",
        "Classical",
        "Electronic"
      ]
    end

    before_save :set_styles

    def set_styles
      self.styles = self.styles.reject{|e| e.empty? }
    end
end
