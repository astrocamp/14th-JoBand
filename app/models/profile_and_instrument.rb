# frozen_string_literal: true

class ProfileAndInstrument < ApplicationRecord
  belongs_to :profile
  belongs_to :instrument
end
