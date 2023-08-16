# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :phone
      t.string :location
      t.integer :seniority
      t.text :content

      t.timestamps
    end
  end
end
