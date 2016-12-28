class AddIndexToImageUserCategories < ActiveRecord::Migration
  def change
    add_index :image_user_categories, :image_user_id
    add_index :image_user_categories, :category_id
  end
end
