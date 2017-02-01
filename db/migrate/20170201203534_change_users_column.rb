class ChangeUsersColumn < ActiveRecord::Migration
  def change
    rename_column :users, :W, :w
    rename_column :users, :C, :c
    rename_column :users, :M, :m
    rename_column :users, :U, :u
  end
end
