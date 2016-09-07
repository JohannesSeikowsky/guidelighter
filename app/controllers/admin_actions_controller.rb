class AdminActionsController < ApplicationController

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['admin_user'] && password == ENV['admin_pw']
    end 
  end

  before_filter :authenticate


  def general
  end

  def advisors_mgmt
    @all_advisors = Advisor.all
  end

  def profiles_mgmt
    @all_profiles = Profile.all
  end

  def listings_mgmt
    @all_listings = Listing.all
  end

end
