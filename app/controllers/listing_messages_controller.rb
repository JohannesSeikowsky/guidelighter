class ListingMessagesController < ApplicationController

  def create
    @listing = Listing.find(params[:message][:listing_id])
    ListingMessage.create(listing_message_params)
    # mailer
    redirect_to show_listing_path(params[:message][:listing_id]), notice: "Your message has been sent. We will get back to you asap."
  end

  private
  def listing_message_params
    params.require(:message).permit(:content, :reply_address, :listing_id)
  end

end
