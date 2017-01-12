class ImageWishlist < ActiveRecord::Base
  belongs_to :image
  belongs_to :wishlist
end 