class AdvisorsController < ApplicationController

  # Password reset
  def pw_reset
    @identifier = params[:pw_reset_identifier]
    @advisor = Advisor.find_by_pw_reset_identifier(params[:pw_reset_identifier])
  end

  def pw_reset_action
  end

  def pw_reset_success
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