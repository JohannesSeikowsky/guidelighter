class ListingMessagesController < ApplicationController

  def create
    @advisor = Advisor.find(params[:message][:advisor_id])
    @profile = @advisor.profile
    @content = params[:message][:content]
    @reply_address = params[:message][:reply_address]
    # mailer
    GeneralMailer.question_message(@advisor, @content, @reply_address).deliver
    # redirect
    redirect_to show_profile_path(profile_id: @profile.id), notice: "Your message has been sent. We will get back to you asap."
  end


  private
  def listing_message_params
    params.require(:message).permit(:content, :reply_address, :listing_id)
  end

end
