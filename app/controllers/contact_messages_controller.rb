class ContactMessagesController < ApplicationController

  def new
  end

  def request_consultation
  end

  def create
    @message = ContactMessage.create(content: params[:message][:user_input], reply_address: params[:message][:email])
    GeneralMailer.contact_us_message(@message).deliver if Rails.env.production?
    redirect_to root_path, notice: "Your message has been sent. We will get back to you within a day."
  end

  def new_user_request
  end

  def new_password_request
  end

  def pw_retrieval_email
    # find advisor who is requesting new pw
    @advisor = Advisor.find_by(email: params[:password_request][:email])
    # set advisors pw identifier attr to a salt
    @pw_reset_identifier = SecureRandom.urlsafe_base64
    @advisor.pw_reset_identifier = @pw_reset_identifier
    @advisor.save(:validate => false)
    # send out email and render view
    GeneralMailer.pw_retrieval_email(params[:password_request][:email],@pw_reset_identifier).deliver #if Rails.env.production?
    render "new_password_requested"
  end

end
