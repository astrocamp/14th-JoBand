class RemoveBandIdForRecruit < ActiveRecord::Migration[7.0]
  def change
    remove_column :recruits, :band_id, :bigint
  end
end
