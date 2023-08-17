# frozen_string_literal: true

class RecruitAndInstrument < ApplicationRecord
  belongs_to :recruit
  belongs_to :instrument
end
