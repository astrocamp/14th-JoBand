class AddBandIdToActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :band, foreign_key: true
    add_column :activities, :city, :integer
  end
end
