class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :band, null: false, foreign_key: true
      t.decimal :amount
      t.text :note
      t.string :serial
      t.string :status, default: 'pending'

      t.timestamps
    end
    add_index :donations, :serial, unique: true
  end
end
