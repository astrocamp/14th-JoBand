class CreateBandStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :band_styles do |t|
      t.belongs_to :band, null: false, foreign_key: true
      t.belongs_to :style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
