class PagesController < ApplicationController

  def home
    @listings = Listing.order("title ASC")
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
