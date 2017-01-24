class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
  
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = 'Your message has been sent! We will review it as soon as possible.'
      render :new
    else
      flash.now[:danger] = 'Sorry, something went wrong. Please try again later'
      render :new
    end
  end
end
