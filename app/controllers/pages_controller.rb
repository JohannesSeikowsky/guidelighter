class PagesController < ApplicationController

  def home
    @listings = Listing.order("updated_at ASC")
    @advisors = Advisor.all
  end

  def about
  end

  def contact
  end

  def how
  end

  def reviews
  end

  def ambassadors
    redirect_to "https://docs.google.com/forms/d/1T577lD9Nrl3MrGx_IVzEHHTmdmAKcDQkIWOGgsd8Ehk/edit?ts=57fa4bd5"
  end

end
