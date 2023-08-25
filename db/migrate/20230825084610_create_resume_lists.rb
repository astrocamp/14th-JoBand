class CreateResumeLists < ActiveRecord::Migration[7.0]
  def change
    create_table :resume_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recruit, null: false, foreign_key: true
      t.string :role
      t.text :description
      t.integer :status
      
      t.timestamps
    end
  end
end
