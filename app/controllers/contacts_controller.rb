class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
  
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = 'Thank you for your message. We will review it soon!'
      render :new
    else
      flash.now[:danger] = 'Cannot send message.'
      render :new
    end
  end
end
