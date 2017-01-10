class MenusController < ApplicationController
  def new 
    @menu = Menu.new
    @user = current_user
  end 
  
  def create
    @menu = Menu.new(menu: params[:file], user: current_user)
    if @menu.save 
     respond_to do |format|
      format.json {render :json => @menu}
      format.html {
        flash[:success]= "Menu uploaded successfully"
      }
     end
    end 
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