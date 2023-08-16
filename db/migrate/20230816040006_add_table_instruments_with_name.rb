class AddTableInstrumentsWithName < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
