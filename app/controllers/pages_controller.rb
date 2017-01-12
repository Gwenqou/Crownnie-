class PagesController < ApplicationController 
  def home 
    @cats = ['Women\'s cut','Men\'s cut','Color','Bridal','Prom']
  end 
  
end