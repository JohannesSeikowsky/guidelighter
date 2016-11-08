class PagesController < ApplicationController

  def home
    @advisors = Advisor.find([77,78,79,80,81,82,83,84,85,86,87,88,89,90])
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
