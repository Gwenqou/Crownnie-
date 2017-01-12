class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :image_wishlists
  has_many :images, through: :image_wishlists

end 
