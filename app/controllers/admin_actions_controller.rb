class AdminActionsController < ApplicationController

  # simplest authentication
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['admin_user'] && password == ENV['admin_pw']
    end 
  end
  before_filter :authenticate if Rails.env.production?


  def admin
    @all_advisors = Advisor.order("first_name ASC")
    @listings_count = Listing.all.count
    
    @advisors_with_listings = 0
    @all_advisors.each do |adv|
      if adv.listings.count > 0
        @advisors_with_listings += 1
      end
    end
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
    redirect_to admin_path, notice: "Profile updated."
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
  def tagging
    if params[:category] == "none"
      @all_listings = Listing.where(tags: "no_tag_yet").order("updated_at DESC")   
    elsif params[:category] == "application_help"
      @all_listings = Listing.where("tags like ?", "%application_help%").order("updated_at DESC")
    elsif params[:category] == "career_insights"
      @all_listings = Listing.where("tags like ?", "%career_insights%").order("updated_at DESC")
    elsif params[:category]== "practical_expertise"
      @all_listings = Listing.where("tags like ?", "%practical_expertise%").order("updated_at DESC")
    else 
      @all_listings = Listing.order("updated_at DESC")      
    end
  end

  def update_tags
    @all_listings = Listing.order("updated_at DESC")
    render "tagging"
  end

  def mass_updating
    # find each listing using an identifier
    # update each listing with the associated new tag
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
    params.require(:profile).permit(:description, :profile_image)
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price)
  end
end
