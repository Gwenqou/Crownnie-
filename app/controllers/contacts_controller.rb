class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.deliver_now
      flash.now[:success] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:danger] = 'Cannot send message.'
      render :new
    end
  end
end
