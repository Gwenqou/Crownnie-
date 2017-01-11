class AddIsStylistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_stylist, :boolean, default: false
  end
end
