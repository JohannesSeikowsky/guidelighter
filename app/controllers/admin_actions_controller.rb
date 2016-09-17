class AdminActionsController < ApplicationController

  # simplest authentication
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['admin_user'] && password == ENV['admin_pw']
    end 
  end
  before_filter :authenticate if Rails.env.production?


  # entry
  def admin
    @all_advisors = Advisor.order("first_name ASC")
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

  # tagging
  def tagging
    if params[:no_tags]
      @all_listings = Listing.where("tags is NULL or tags = ''").order("updated_at DESC")
    else 
      @all_listings = Listing.order("updated_at DESC")      
    end
    @lastly_updated_listing = Listing.order("updated_at").last

    # gather all tag strings
    @tag_string = ""
    Listing.all.each do |list|
      @tag_string << ","
      @tag_string << list.tags
    end
    # produce tags array
    @tag_array = @tag_string.split(",")
    # downcase all
    @tag_array = @tag_array.map!{ |tag| tag.downcase }
    # remove white space in beginning of each strings    
    @tag_array = @tag_array.map!(&:lstrip)
    # avoid tag repetition
    @tag_array = @tag_array.uniq
    # order aphabetically
    @tag_array = @tag_array.sort_by(&:downcase)
  end

  def update_tags
    @listing = Listing.find(params[:listing_id])
    @listing.update_attributes(tags: params[:listing][:tags])
    redirect_to tagging_path, notice: "Updated."
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


  private
  def profile_params
    params.require(:profile).permit(:description, :profile_image)
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price)
  end
end
