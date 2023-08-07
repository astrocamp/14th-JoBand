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
    active: 0,          # 活躍中
    recruiting: 1,      # 招募中
    on_break: 2,        # 暫時休團
    disbanded: 3        # 解散
>>>>>>> 54d4f6e (feat: add Band's CRU)
  }, _prefix: true

  enum area: {
    North: 0,
    Central: 1,
<<<<<<< HEAD
    South: 2,
    East: 3,
  },_prefix: true
=======
    south: 2,
    north: 3,
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
  # enum styles: {
  #   pop: 0,       #流行
  #   folk: 1,      #民謠
  #   rock: 2,      #搖滾
  #   hip_hop: 3,   #嘻哈
  #   metal: 4,     #金屬
  #   jazz: 5,      #爵士
  #   classical: 6, #古典
  #   elecronic: 7  #電子
  # }, _prefix: true

  

>>>>>>> 54d4f6e (feat: add Band's CRU)


end
