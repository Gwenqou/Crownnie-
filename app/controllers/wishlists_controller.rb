class WishlistsController < ApplicationController
  
  def show 
     @user = current_user
  end 
  
  def destroy
    @user = current_user
    @image = Image.find(params[:image])
    @image.image_wishlists.each do |iw|
      if iw.wishlist.user_id === @user.id
        iw.destroy()
      end 
    end 
    respond_to do |format|
      format.html { redirect_to :back, flash[:success] = "Image was successfully deleted" }
      format.js 
    end 
  end 
  
end 