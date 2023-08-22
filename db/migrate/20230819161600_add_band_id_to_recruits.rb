# frozen_string_literal: true

class AddBandIdToRecruits < ActiveRecord::Migration[7.0]
  def change
    add_reference :recruits, :band, foreign_key: true
  end
end
