class AdvisorsController < ApplicationController

  def signup
    @advisor = Advisor.new
  end

  def signup_action
    @advisor = Advisor.new(advisor_params)
    if @advisor.save
      #GeneralMailer.successful_signup(@advisor).deliver
      log_in
      redirect_to new_profile_path, notice: "You have signed up."
    else
      render 'signup'
    end
  end

  private
  def advisor_params
    params.require(:advisor).permit(:first_name, :second_name, :email, :password_provided)
  end

end