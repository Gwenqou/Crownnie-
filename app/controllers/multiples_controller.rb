class MultiplesController < ApplicationController
  
  before_action :require_user, only: [:edit, :update]
  before_action :require_admin, only: [:edit, :update]
  
  def edit
    @multiple = Multiple.first
  end 
  
  def update
    @multiple = Multiple.first
    if @multiple.update(multiple_params)
        flash[:success] = 'Multiple Upload Function is updated'
        redirect_to :back
    else
      render 'edit'
    end 
  end 
  
  
  
  private
  
  def multiple_params
    params.require(:multiple).permit(:multiple)
  end 
  

end 