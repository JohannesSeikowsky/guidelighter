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
    redirect_to advisor_overview_path(advisor_id: @profile.advisor.id), notice: "Updated."
  end

  def admin_edit_listing
    @listing = Profile.find(params[:listing_id])
  end

  def update_listing
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
end
