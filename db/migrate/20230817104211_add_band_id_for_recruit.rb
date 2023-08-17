# frozen_string_literal: true

class AddBandIdForRecruit < ActiveRecord::Migration[7.0]
  def change
    add_column :recruits, :band_id, :bigint
  end
end
