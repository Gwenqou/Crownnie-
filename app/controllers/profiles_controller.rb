class ProfilesController < ApplicationController
  before_action :require_user, only: [:index, :show ]
  
  def index 
    @users = User.where(is_stylist: true).page(params[:page]).per(25)
    if params[:location].present?
      @radius = params[:radius] || 5
      @users = User.where(is_stylist: true).where.not(salon_location: [nil, '']).near(params[:location], @radius).page(params[:page]).per(25)
    end 
    if params[:query].present?
     @users = User.text_search(params[:query]).page(params[:page]).per(25)

    end 
    
  end 
  
  def show 
    @user = User.where(is_stylist: true).friendly.find(params[:id])
  end 
end
