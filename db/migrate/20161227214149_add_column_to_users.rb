class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salon_name, :string 
    add_column :users, :salon_location, :string
    add_column :users, :appointment_number, :string
    
  end
end
