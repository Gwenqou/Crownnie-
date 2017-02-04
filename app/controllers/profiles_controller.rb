class ProfilesController < ApplicationController
  
  def index 
    @users = User.where(is_stylist: true)
     if params[:location].present?
       @radius = params[:radius] || 5
       @users = User.where(is_stylist: true).where.not(salon_location: [nil, '']).near(params[:location], @radius)
     end 
     
    
  end 
  
  def show 
    @user = User.where(is_stylist: true).friendly.find(params[:id])
  end 
end
