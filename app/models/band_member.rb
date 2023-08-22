class BandMember < ApplicationRecord
  belongs_to :user
  belongs_to :band

  enum band_role: [:leader, :manager, :member]
  
end
