class ContactMessagesController < ApplicationController

  def new
  end

  def create
    @message = ContactMessage.create(content: params[:message][:user_input])
    GeneralMailer.contact_us_message(@message).deliver
    redirect_to root_path, notice: "Your message has been successfully sent."
  end

end
