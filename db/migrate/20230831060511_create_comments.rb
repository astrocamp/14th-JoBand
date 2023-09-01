class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user, null: false, foreign_key: true
      t.references :commentable, polymorphic: true, null: false
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :comments, :deleted_at
  end
end
