class AddUserRelationWith < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :profiles, :user, index: true
  end
end
