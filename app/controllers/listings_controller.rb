class ListingsController < ApplicationController

  def new_listing
    @advisor = Advisor.find(session[:id])
    @listings = @advisor.listings
  end

  def new_listing_action
    @advisor = Advisor.find(session[:id])
    @listing = @advisor.listings.build(listing_params)
    if @listing.save
      redirect_to new_listing_path, notice: "Listing published. Continue, if you like."
    else
      render 'new_listing'
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :listing_image)
  end

end