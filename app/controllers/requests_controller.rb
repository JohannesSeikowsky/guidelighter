class RequestsController < ApplicationController

  def new_request
    @listing_id = params[:listing_id]
    @listing = Listing.find(params[:listing_id])
  end

  def create_request
    @listing = Listing.find(params[:listing_id])
    @request = @listing.requests.build(request_params)
    if @request.save
      # notifying us with details of request
      GeneralMailer.request_notification(@request).deliver if Rails.env.production?
      # notifying user that request was sent
      GeneralMailer.request_delivery_confirmation(@request).deliver
      # redirect
      redirect_to successful_request_path, notice: "Your request has been sent successfully."
    else
      redirect_to new_request_path(listing_id: @listing.id), notice: "Please fill out the fields before send your request."
    end
  end

  def successful_request
  end

  private
  def request_params
    params.require(:request).permit(:requesting_email, :requesting_availability, :listing_id)
  end

end
