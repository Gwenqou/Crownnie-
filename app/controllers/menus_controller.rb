class MenusController < ApplicationController
  def new 
  end 
  
  def create
    @menu = Menu.new(menu_params)
    @menu.save 
  end 
  
  def edit 
  end 
  
  def update
  end 
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy()
    redirect_to :back
  end 
  
  def show
  end 
  
  private
  
  def menu_params
    require(:menu).permit(:user_id, :menu)
  end 
end 