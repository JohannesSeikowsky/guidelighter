class PagesController < ApplicationController

  def home
    @listings = Listing.order("created_at DESC")
  end

  def about
  end

  def contact
  end

  def how
  end

  def reviews
  end

end
