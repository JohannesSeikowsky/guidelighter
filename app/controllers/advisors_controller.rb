class AdvisorsController < ApplicationController

  def signup
    @advisor = Advisor.new
  end

  def signup_action
    @advisor = Advisor.new(advisor_params)
    if @advisor.save
      redirect_to new_profile_path(id: @advisor.id)
    else
      render 'signup', notice: "Try again."
    end
  end

  private
  def advisor_params
    params.require(:advisor).permit(:first_name, :second_name, :email, :password)
  end

end