# frozen_string_literal: true

class AddUserNameToNullFalse < ActiveRecord::Migration[7.0]
  def up
    change_column_null(:users, :name, false)
  end

  def down
    change_column_null(:users, :name, true)
  end
end
