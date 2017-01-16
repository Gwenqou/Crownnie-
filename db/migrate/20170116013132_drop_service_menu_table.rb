class DropServiceMenuTable < ActiveRecord::Migration
  def change
    drop_table :service_menus
  end
end
