class CreateRecruitAndInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :recruit_and_instruments do |t|
      t.belongs_to :recruit, null: false, foreign_key: true
      t.belongs_to :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
