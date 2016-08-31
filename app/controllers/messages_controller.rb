class MessagesController < ApplicationController

  def new
  end

  def create
    @message = Message.create(contact_us: params[:message][:user_input])
    GeneralMailer.contact_us_message(@message).deliver
    redirect_to root_path, notice: "Your message was successfully sent."
  end

end
