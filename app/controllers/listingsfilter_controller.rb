class ListingsfilterController < ApplicationController
 
  def find_listings
    @search = params[:search]
    # listings where the tags attribute includes params[:search]
    @listings = Listing.where("tags like ?", "%#{@search}%")
    render "search_results"
  end

end
