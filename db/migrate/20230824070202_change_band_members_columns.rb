# frozen_string_literal: true

class ChangeBandMembersColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :band_members, :band_role, :identity
    add_column :band_members, :role, :string
  end
end
