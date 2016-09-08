class PagesController < ApplicationController

  def home
    @listings = Listing.order("RANDOM()")
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
