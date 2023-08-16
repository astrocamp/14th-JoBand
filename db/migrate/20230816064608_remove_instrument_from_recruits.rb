class RemoveInstrumentFromRecruits < ActiveRecord::Migration[7.0]
  def change
    remove_column :recruits, :instrument, :integer
  end
end
