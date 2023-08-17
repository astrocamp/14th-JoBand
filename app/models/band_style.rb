# frozen_string_literal: true

class BandStyle < ApplicationRecord
  belongs_to :band
  belongs_to :style
end
