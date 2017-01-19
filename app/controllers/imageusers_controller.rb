class ImageusersController < ApplicationController
  
  def destroy
    @image_user = ImageUser.find(params[:id])
    respond_to do |format|
      if @image_user.destroy()
        format.html { redirect_to :back, flash[:success] = "Image was successfully deleted" }
        format.js 
      else 
        format.html { redirect_to :back, flash[:danger] = "something went wrong" }
      end 
    end 
  end 
  
end 