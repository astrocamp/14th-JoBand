class Recruit < ApplicationRecord 
 
    # belongs_to :band
 
 
    enum instrument:{
         vocal: 0,
         guitar: 1,
         bass: 2,
         drum: 3,
         keyboard: 4
    },_prefix: true

        enum area:{
         north: 0,
         central: 1,
         south: 2,
         notrh: 3
    },_prefix: true


end
