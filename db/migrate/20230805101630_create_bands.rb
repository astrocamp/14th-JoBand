# frozen_string_literal: true

class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.text :content
      t.integer :area
      t.integer :state
      t.date :founded_at

      t.timestamps
    end
  end
end
