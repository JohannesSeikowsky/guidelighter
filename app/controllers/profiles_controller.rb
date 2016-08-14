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
    @profile = Profile.find(params[:profile_id])
    @advisor = @profile.advisor
  end


  private
  def profile_params
    params.require(:profile).permit(:description, :profile_image)
  end

end