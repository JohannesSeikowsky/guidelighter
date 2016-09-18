class ContactMessagesController < ApplicationController

  def new
  end

  def create
    @message = ContactMessage.create(content: params[:message][:user_input], reply_address: params[:message][:email])
    GeneralMailer.contact_us_message(@message).deliver if Rails.env.production?
    redirect_to root_path, notice: "Your message has been successfully sent."
  end

  def new_user_request
  end

end
