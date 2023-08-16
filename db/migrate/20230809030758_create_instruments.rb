# frozen_string_literal: true

class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.boolean :vocal
      t.boolean :guitar
      t.boolean :bass
      t.boolean :keyboard
      t.boolean :drum
      t.string :others
      t.belongs_to :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
