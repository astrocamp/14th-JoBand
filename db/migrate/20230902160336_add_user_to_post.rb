class AddUserToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, index: true
  end
end
