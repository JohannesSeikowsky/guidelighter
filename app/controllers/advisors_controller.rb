class AdvisorsController < ApplicationController

  def signup
    @advisor = Advisor.new
  end

  def signup_action
    @advisor = Advisor.new(advisor_params)
    if @advisor.save
      log_in
      redirect_to new_profile_path
    else
      render 'signup'
    end
  end

  private
  def advisor_params
    params.require(:advisor).permit(:first_name, :second_name, :email, :password_provided)
  end

end