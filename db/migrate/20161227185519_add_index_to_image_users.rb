class AddIndexToImageUsers < ActiveRecord::Migration
  def change
    add_index :image_users, :image_id
    add_index :image_users, :user_id
  end
end
