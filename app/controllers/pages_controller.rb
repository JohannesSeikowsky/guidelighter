class PagesController < ApplicationController

  def home
    @advisors = Advisor.find([307,268,158,184,177,121,129,3,37,1,102,161]) if Rails.env.production?
    @advisors = Advisor.all if Rails.env.development?
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
