class RemoveColumnInChannel < ActiveRecord::Migration[7.0]
  def change
    remove_column :channels, :body
    remove_column :channels, :deleted_at
  end
end
