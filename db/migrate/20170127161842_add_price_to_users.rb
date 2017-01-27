class AddPriceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :women_cut, :string
    add_column :users, :single_process, :string
  end
end
