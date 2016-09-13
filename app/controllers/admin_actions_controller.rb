class AdminActionsController < ApplicationController

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['admin_user'] && password == ENV['admin_pw']
    end 
  end

  before_filter :authenticate if Rails.env.production?


  def general
  end

  def advisors_mgmt
    @all_advisors = Advisor.order("first_name ASC")
  end

  def profiles_mgmt
    @all_profiles = Profile.all
  end

  def listings_mgmt
    @all_listings = Listing.all
  end

  # editing
  def advisor_overview
    @advisor = Advisor.find(params[:advisor_id])
    @profile = @advisor.profile if @advisor.profile
    @listings = @advisor.listings if @advisor.listings
  end

  def edit_profile
  end

  def edit_listing
  end


  # destroying
  def destroy_advisor
    @advisor = Advisor.find(params[:advisor_id])
    if @advisor
      @advisor.delete 
      @advisor.profile.delete if @advisor.profile
      if @advisor.listings
        @advisor.listings.each do |list|
          list.delete
        end
      end
    end
    redirect_to advisors_mgmt_path, notice: "Advisor + Profiles + Listings destroyed."
  end

end
