class Recruit < ApplicationRecord 
 
    belongs_to :band
    has_many :instrument, through: :recruit_and_instrument
 
        enum area:{
         north: 0,
         central: 1,
         south: 2,
         notrh: 3
    },_prefix: true
    
end
