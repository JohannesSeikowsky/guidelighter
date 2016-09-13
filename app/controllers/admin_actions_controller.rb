class AdminActionsController < ApplicationController

  # PROTECTION
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['admin_user'] && password == ENV['admin_pw']
    end 
  end
  before_filter :authenticate if Rails.env.production?


  # OVERVIEW PAGES
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


  # UPDATING
  def advisor_overview
    @advisor = Advisor.find(params[:advisor_id])
    @profile = @advisor.profile if @advisor.profile
    @listings = @advisor.listings if @advisor.listings
  end

  def admin_edit_profile
    @profile = Profile.find(params[:profile_id])
  end
  
  def admin_update_profile
    @profile = Profile.find(params[:profile_id])
    @profile.update(profile_params)
    redirect_to advisor_overview_path(advisor_id: @profile.advisor.id), notice: "Profile updated."
  end

  def admin_edit_listing
    @listing = Listing.find(params[:listing_id])
  end

  def admin_update_listing
    @listing = Listing.find(params[:listing_id])
    @listing.update(listing_params)
    redirect_to advisor_overview_path(advisor_id: @listing.advisor.id), notice: "Listing updated."
  end


  # DESTROYING
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

  private
  def profile_params
    params.require(:profile).permit(:description, :profile_image)
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price)
  end
end
