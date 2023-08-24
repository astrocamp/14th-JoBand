# frozen_string_literal: true

class BandMember < ApplicationRecord
  belongs_to :user
  belongs_to :band

  enum identity: %i[leader manager member]
  
  def self.default_roles
    [
     'Guitar',
     'Bass',
     'Vocal',
     'Drum',
     'Keyboard'
    ]
  end
end
