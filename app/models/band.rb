class Band < ApplicationRecord
  validates :name ,presence: true

<<<<<<< HEAD
  has_many :band_styles
  has_many :styles, through: :band_styles

  enum state: {
    active: 0,      # 活躍中
    recruiting: 1,  # 招募中
    on_break: 2,    # 暫時休團
    disbanded: 3    # 解散
=======
  enum state: {
<<<<<<< HEAD
    active: 0,          # 活躍中
    recruiting: 1,      # 招募中
    on_break: 2,        # 暫時休團
    disbanded: 3        # 解散
>>>>>>> 54d4f6e (feat: add Band's CRU)
=======
    active: 0,      # 活躍中
    recruiting: 1,  # 招募中
    on_break: 2,    # 暫時休團
    disbanded: 3    # 解散
>>>>>>> be8e526 (style: Code Tidying)
  }, _prefix: true

  enum area: {
    North: 0,
    Central: 1,
<<<<<<< HEAD
<<<<<<< HEAD
    South: 2,
    East: 3,
  },_prefix: true
=======
    south: 2,
    north: 3,
=======
    South: 2,
    East: 3,
>>>>>>> be8e526 (style: Code Tidying)
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
<<<<<<< HEAD
  

  

>>>>>>> 54d4f6e (feat: add Band's CRU)

=======
>>>>>>> 2e0aeda (fix: change redirect_to from band's update)

end
