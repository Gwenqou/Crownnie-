class AddIndexToImageWishlists < ActiveRecord::Migration
  def change
    add_index :image_wishlists, :wishlist_id
    add_index :image_wishlists, :image_id
  end
end
