class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.datetime :deleted_at, index: true
      t.references :user, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
