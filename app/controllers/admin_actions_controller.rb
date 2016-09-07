class AdminActionsController < ApplicationController

  def login
  end

  def general
  end

  def advisors_mgmt
    @all_advisors = Advisor.all
  end

  def profiles_mgmt
    @all_profiles = Profile.all
  end

  def listings_mgmt
    @listings = Listing.all
  end

end
