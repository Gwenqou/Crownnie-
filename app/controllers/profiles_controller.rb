class ProfilesController < ApplicationController
  
  def index 
    @users = User.where(is_stylist: true).page(params[:page]).per(25)
    if params[:location].present?
      @radius = params[:radius] || 5
      @users = User.where(is_stylist: true).where.not(salon_location: [nil, '']).near(params[:location], @radius).page(params[:page]).per(25)
    end 
    if params[:name].present?
      @search = User.search do 
        fulltext params[:name]
      end 
      @users = @search.results
    end 
    
  end 
  
  def show 
    @user = User.where(is_stylist: true).friendly.find(params[:id])
  end 
end
