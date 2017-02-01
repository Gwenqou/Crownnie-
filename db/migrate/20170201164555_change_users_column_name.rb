class ChangeUsersColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :women_cut, :W
    rename_column :users, :single_process, :C
    add_column :users, :M, :string
    add_column :users, :U, :string
  end
end
