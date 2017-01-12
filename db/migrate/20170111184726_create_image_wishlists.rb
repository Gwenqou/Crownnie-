class CreateImageWishlists < ActiveRecord::Migration
  def change
    create_table :image_wishlists do |t|
      t.integer :wishlist_id
      t.integer :image_id
    end
  end
end
