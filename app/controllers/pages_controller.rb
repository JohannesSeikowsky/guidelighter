class PagesController < ApplicationController

  def home
    @advisors = Advisor.where(id: [])
    @advisors = Advisor.order("created_at DESC")
  end

  def about
  end

  def contact
  end

  def how
  end

  def reviews
  end

  def successful_signup
  end

  def terms
  end

  def newsletter
  end

  def ambassadors
    redirect_to "https://docs.google.com/forms/d/1T577lD9Nrl3MrGx_IVzEHHTmdmAKcDQkIWOGgsd8Ehk/edit?ts=57fa4bd5"
  end

end
