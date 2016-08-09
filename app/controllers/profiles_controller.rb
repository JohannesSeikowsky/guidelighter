class ProfilesController < ApplicationController

  def new_profile
    @advisor = Advisor.find(session[:id])
    @profile = @advisor.profile
  end

  def new_profile_action
    @advisor = Advisor.find(session[:id])
    @profile = @advisor.build_profile(profile_params)
    if @profile.save
      redirect_to new_listing_path
    else
      render 'new_profile'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:description, :profile_image)
  end

end