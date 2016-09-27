class ListingsfilterController < ApplicationController
 
   def find_listings
    @search = params[:search]
    @listings = Listing.where("tags like ?", "%#{@search}%").order("updated_at DESC")
    
    respond_to do |format|
      format.html { render "find_listings.html.erb" }
      format.js { render "find_listings.erb.js" }
    end
  end

end
