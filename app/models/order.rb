class Order < ApplicationRecord
  
  # associations
  belongs_to :user
  belongs_to :band

end
