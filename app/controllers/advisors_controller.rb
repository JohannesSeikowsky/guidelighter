class AdvisorsController < ApplicationController

  # Password reset
  def pw_reset
    @identifier = params[:pw_reset_identifier]
    @advisor = Advisor.find_by_pw_reset_identifier(params[:pw_reset_identifier])
  end

  def pw_reset_action
    @advisor = Advisor.find(params[:advisor_id])
    @advisor.update(advisor_params)
    redirect_to login_path, notice: "Your password has been reset. Login."
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
    params.require(:advisor).permit(:first_name, :second_name, :email, :password_provided, :new_password_provided)
  end

end