class ListingsController < ApplicationController

  def new_listing
    @advisor = Advisor.find(params[:id])
    @listings = @advisor.listings
  end

  def new_listing_action
    @advisor = Advisor.find(params[:listing][:advisor_id])
    @listing = @advisor.listings.build(listing_params)
    if @listing.save
      redirect_to new_listing_path(id: @advisor.id), notice: "Listing published. Continue, if you like."
    else
      render 'new_listing', notice: "Try again."
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :listing_image)
  end

end