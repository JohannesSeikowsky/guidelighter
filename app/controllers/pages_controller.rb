class PagesController < ApplicationController

  def home
    @advisors = Advisor.all
    @listings = []
    
    @advisors.each do |adv|
      @listings << adv.listings.first
    end
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
