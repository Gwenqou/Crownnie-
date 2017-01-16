class AddIndexToWishlists < ActiveRecord::Migration
  def change
     add_index :wishlists, :user_id
  end
end
