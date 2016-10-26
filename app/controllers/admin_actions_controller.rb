class AdminActionsController < ApplicationController

  # simplest authentication
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['admin_user'] && password == ENV['admin_pw']
    end 
  end
  before_filter :authenticate if Rails.env.production?


  def admin
    @all_advisors = Advisor.order("updated_at ASC")
    #counts
    @advisor_count = @all_advisors.count
    
    @advisors_with_profile = 0
    @all_advisors.each do |adv|
      unless adv.profile.nil?
        @advisors_with_profile += 1
      end
    end

    @advisors_without_profile = @advisor_count - @advisors_with_profile
  end

  def profiles_overview
    @profiles = Profile.order("updated_at ASC")
  end
  
  def listings_overview
    @listings = Listing.all
  end

  def advisors_resources
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
    redirect_to profiles_overview_path, notice: "Profile updated."
  end

  def admin_edit_listing
    @listing = Listing.find(params[:listing_id])
  end

  def admin_update_listing
    @listing = Listing.find(params[:listing_id])
    @listing.update(listing_params)
    redirect_to admin_path, notice: "Listing updated."
  end

  # tagging
  def profile_tagging
    @profiles = Profile.order("updated_at ASC")
    @profiles_with_advisor = []
    @profiles.each do |prof|
      if prof.advisor
        @profiles_with_advisor << prof 
      end
    end
  end

  def tagging
    if params[:category] == "none"
      @all_listings = Listing.where(tags: "no_tag_yet").order("updated_at ASC")   
    elsif params[:category] == "application_help"
      @all_listings = Listing.where("tags like ?", "%application_help%").order("updated_at ASC")
    elsif params[:category] == "career_insights"
      @all_listings = Listing.where("tags like ?", "%career_insights%").order("updated_at ASC")
    elsif params[:category]== "practical_expertise"
      @all_listings = Listing.where("tags like ?", "%practical_expertise%").order("updated_at ASC")
    else 
      @all_listings = Listing.order("updated_at ASC")      
    end
  end

  def update_tags
    @listing = Listing.find(params[:listing_id])
    @listing.update_attributes(tags: params[:listing][:tags])
    redirect_to tagging_path, notice: "Tags Updated."
  end

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
    redirect_to admin_path, notice: "Advisor + Profiles + Listings destroyed."
  end


  private
  def profile_params
    params.require(:profile).permit(:description, :profile_image, :job_title, :application_help, :career_insights_help, :mentoring_help, :general_help, :session_price, :max_no_of_session, :charity_option, :tags)
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price)
  end
end

