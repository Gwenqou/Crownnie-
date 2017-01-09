class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.belongs_to :user
      t.string :menu
      t.timestamps 
    end
  end
end
