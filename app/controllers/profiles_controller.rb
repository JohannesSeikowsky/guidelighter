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
        redirect_to successful_signup_path, notice: "Success."
      else
        render 'new_profile'
      end
    else
      redirect_to login_path, notice: "Please log in."
    end 
  end

  def show
    @profile = Profile.find(params[:profile_id])
    @advisor = @profile.advisor
  end

  def edit
    if logged_in?
      @advisor = Advisor.find(session[:id])
      unless @advisor.profile.nil?  
        @profile = @advisor.profile
      else 
        redirect_to login_path, notice: "You don't have a profile. Sign up again."        
      end
    else
      redirect_to login_path, notice: "Please log in."
    end
  end

  def update
    if logged_in?
      @advisor = Advisor.find(session[:id])
      @profile = @advisor.profile
      @profile.update(profile_params)
      redirect_to edit_profile_path(profile_id: @profile.id), notice: "Your profile has been updated."
    else
      redirect_to login_path, notice: "Please log in."
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:description, :profile_image, :job_title, :application_help, :career_insights_help, :mentoring_help, :general_help, :session_price)
  end

end
