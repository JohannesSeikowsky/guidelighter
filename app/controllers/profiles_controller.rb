class ProfilesController < ApplicationController

  def new_profile
    @advisor = Advisor.find(params[:id])
  end

  def new_profile_action
    @advisor = Advisor.find(params[:profile][:advisor_id])
    @profile = @advisor.build_profile(profile_params)
    if @profile.save
      redirect_to new_listing_path(id: @advisor.id)
    else
      render 'new_profile', notice: "Try again."
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:description, :profile_image)
  end

end