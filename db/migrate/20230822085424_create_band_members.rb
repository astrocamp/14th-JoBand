# frozen_string_literal: true

class CreateBandMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :band_members do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :band, null: false, foreign_key: true
      t.string :role
      t.integer :admin

      t.timestamps
    end
  end
end
