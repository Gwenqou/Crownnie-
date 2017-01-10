class MenusController < ApplicationController
  before_action :require_user, only: [:index, :create, :destroy]
  before_action :require_same_user, only: [:destroy]
  
  def index 
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
  
  def require_same_user
    @menu = Menu.find(params[:id])
    if current_user != @menu.user
      flash[:danger] = "You can only delete your own picture"
      redirect_to root_path
    end 
  end 
end 