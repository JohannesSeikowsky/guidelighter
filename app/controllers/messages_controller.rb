class MessagesController < ApplicationController

  def new
  end

  def create
    @message = Message.create(contact_us: params[:message][:user_input])
    redirect_to root_path, notice: "Your message was successfully sent."
  end

end
