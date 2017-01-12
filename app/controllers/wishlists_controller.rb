class WishlistsController < ApplicationController
  
  def show 
     @user = current_user
  end 
  
  def destroy
    @image_wishlist = ImageWishlist.find(params[:id])
    @image_wishlist.destroy()
    redirect_to :back
  end 
  
end 