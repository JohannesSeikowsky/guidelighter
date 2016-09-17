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
      @all_listings = Listing.where("tags is NULL or tags = ''").order("title ASC")
    else 
      @all_listings = Listing.order("title ASC")      
    end
    @lastly_updated_listing = Listing.order("updated_at").last

    # get all tags in one big string, then split into an array 
    @tag_string = ""
    Listing.all.each do |list|
      @tag_string << ","
      @tag_string << list.tags
    end
    @tag_array = @tag_string.split(",")
    # remove white space in beginning of each strings in array    
    @tag_array = @tag_array.map(&:lstrip)
    # remove empty string from array
    @tag_array = @tag_array.delete("")
    # avoid repetition of tags
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
