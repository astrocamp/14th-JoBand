# frozen_string_literal: true

class CreateRecruits < ActiveRecord::Migration[7.0]
  def change
    create_table :recruits do |t|
      t.string :recruit_title
      t.integer :instrument
      t.text :condition
      t.string :practice_time
      t.integer :area

      t.timestamps
    end
  end
end
