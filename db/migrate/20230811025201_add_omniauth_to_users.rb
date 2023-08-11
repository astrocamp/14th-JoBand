class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fb_uid, :string
    add_column :users, :fb_token, :string
    add_column :users, :google_uid, :string
    add_column :users, :google_token, :string
  end
end
