class RequestsController < ApplicationController

  def new_request
    @listing_id = params[:listing_id]
    @listing = Listing.find(params[:listing_id])
  end

  def create_request
    @advisor = Advisor.find(params[:advisor_id])
    @request = Request.new(request_params)

    if @request.save
      # notifying us
      # GeneralMailer.request_notification(@request).deliver if Rails.env.production?
      # confirm to user
      # GeneralMailer.request_delivery_confirmation(@request).deliver
      # redirect
      redirect_to successful_request_path, notice: "Your request has been sent successfully."
    else
      # this need to be changed.
      redirect_to show_profile_path(profile_id: @advisor.profile.id), notice: "Please fill out all fields before sending your request."
    end
  end

  def successful_request
  end

  private
  def request_params
    params.require(:request).permit(:requesting_email, :requesting_name, :indicated_interest, :requesting_availability, :advisor_id)
  end

end
