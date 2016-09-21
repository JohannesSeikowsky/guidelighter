class AdvisorsController < ApplicationController

  # Password reset
  def pw_reset
    @advisor = Advisor.find_by_pw_reset_identifier(params[:pw_reset_identifier])
    cookies.permanent[:pw_reset_identifier] = params[:pw_reset_identifier]
  end

  def pw_reset_action
    @advisor = Advisor.find_by_pw_reset_identifier(cookies[:pw_reset_identifier])
    if @advisor
      # updating with new pw
      @advisor.update(advisor_params)
      # setting identifier attribute to nil 
      @advisor.pw_reset_identifier = nil
      @advisor.save(:validate => false)
      # delete cookie
      cookies.delete[:pw_reset_identifier]
      # redirecting
      redirect_to login_path, notice: "Your password has been reset. Login."
    else
      redirect_to root_path, notice: "Not valid. Try again."
    end
  end

  # Advisor signup
  def signup
    @advisor = Advisor.new
  end

  def signup_action
    @advisor = Advisor.new(advisor_params)
    if @advisor.save
      GeneralMailer.successful_signup(@advisor).deliver if Rails.env.production?
      log_in
      redirect_to new_profile_path, notice: "You've signed up. Make a quick profile."
    else
      render 'signup'
    end
  end

  private
  def advisor_params
    params.require(:advisor).permit(:first_name, :second_name, :email, :password_provided)
  end

end