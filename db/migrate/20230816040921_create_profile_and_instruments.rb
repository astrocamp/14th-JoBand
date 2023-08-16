class CreateProfileAndInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_and_instruments do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
