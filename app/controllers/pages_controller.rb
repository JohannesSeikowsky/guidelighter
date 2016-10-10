class PagesController < ApplicationController

  def home
    @listings = Listing.order("updated_at ASC")
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
