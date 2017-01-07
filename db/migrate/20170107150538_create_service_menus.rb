class CreateServiceMenus < ActiveRecord::Migration
  def change
    create_table :service_menus do |t|
      t.integer :user_id
      t.string :menu

      t.timestamps null: false
    end
  end
end
