class ProfilesController < ApplicationController

  def new_profile
    if logged_in?
      @advisor = Advisor.find(session[:id])
      @profile = @advisor.profile
    else
      redirect_to login_path, notice: "Please log in."
    end
  end

  def new_profile_action
    if logged_in?
      @advisor = Advisor.find(session[:id])
      @profile = @advisor.build_profile(profile_params)
      if @profile.save
        redirect_to new_listing_path, notice: "Your profile has been created."
      else
        render 'new_profile'
      end
    else
      redirect_to login_path, notice: "Please log in."
    end 
  end

  def edit
    if logged_in?
      @advisor = Advisor.find(session[:id])
      @profile = @advisor.profile
    else
      redirect_to login_path, notice: "Please log in."
    end
  end

  def update
    if logged_in?
      @advisor = Advisor.find(session[:id])
      @profile = @advisor.profile
      @profile.update(profile_params)
      redirect_to edit_profile_path(profile_id: @profile.id)
    else
      redirect_to login_path, notice: "Please log in."
    end
  end



  private
  def profile_params
    params.require(:profile).permit(:description, :profile_image)
  end

end