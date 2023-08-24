# frozen_string_literal: true

class BandMember < ApplicationRecord
  belongs_to :user
  belongs_to :band

  enum band_role: %i[leader manager member]
  
end
