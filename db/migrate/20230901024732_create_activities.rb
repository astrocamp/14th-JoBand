class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :content
      t.date :begin_at
      t.time :time_start
      t.time :time_end
      t.string :location

      t.timestamps
    end
  end
end
