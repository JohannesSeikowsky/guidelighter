class PagesController < ApplicationController

  def home
    @listings = Listing.order("RANDOM()")
  end

end
