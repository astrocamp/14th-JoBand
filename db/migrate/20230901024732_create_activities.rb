class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :content
      t.date :founded_at
      t.string :location

      t.timestamps
    end
  end
end
