class ChangeRecruitsColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :recruits, :recruit_title, :title
  end
end
