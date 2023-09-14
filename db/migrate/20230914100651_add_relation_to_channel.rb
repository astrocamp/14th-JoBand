class AddRelationToChannel < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :channel, null: true, foreign_key: true
  end
end
