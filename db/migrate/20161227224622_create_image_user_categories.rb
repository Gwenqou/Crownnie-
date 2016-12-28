class CreateImageUserCategories < ActiveRecord::Migration
  def change
    create_table :image_user_categories do |t|
      t.integer :image_user_id
      t.integer :category_id
    
    end
  end
end
