class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :image_wishlists, dependent: :destroy
  has_many :images, through: :image_wishlists

end 
