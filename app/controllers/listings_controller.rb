class ListingsController < ApplicationController

  def show
    @listing = Listing.find(params[:listing_id])
    @advisor = @listing.advisor
    @profile = @advisor.profile
  end

  def new_listing
    if logged_in?
      @advisor = Advisor.find(session[:id])
      @profile = @advisor.profile
      @listings = @advisor.listings
    else
      redirect_to login_path, notice: "Please log in."
    end
  end

  def new_listing_action
    if logged_in?
      @advisor = Advisor.find(session[:id])
      @listing = @advisor.listings.build(listing_params)
      if @listing.save
        redirect_to new_listing_path, notice: "√ Your offer has been published successfully. Post another one?"
      else
        render 'new_listing'
      end
    else
      redirect_to login_path, notice: "Please log in."
    end
  end

  def edit
    if logged_in?
      @listing = Listing.find(params[:listing_id])
    else
      redirect_to login_path, notice: "Please log in."
    end
  end

  def update
    if logged_in?
      @listing = Listing.find(params[:listing_id])
      @listing.update(listing_params)
      redirect_to new_listing_path, notice: "The Listing has been updated."
    else
      redirect_to login_path, notice: "Please log in."
    end
  end

  def destroy
    if logged_in?
      @listing = Listing.find(params[:listing_id])
      @listing.delete
      redirect_to new_listing_path, notice: "The Listing has been deleted."
    else
      redirect_to login_path, notice: "Please log in."
    end      
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :listing_image)
  end
end