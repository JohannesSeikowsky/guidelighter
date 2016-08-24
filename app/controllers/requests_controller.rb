class RequestsController < ApplicationController

  def new_request
    @listing = Listing.find(params[:listing_id])
  end

  def create_listing
  end

end
