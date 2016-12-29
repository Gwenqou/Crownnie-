class CategoriesController < ApplicationController
  
  def show 
    @category = Category.find(params[:id])
  end 
  def index
    @categories = Category.all
    @images = Image.all
  end 
end 