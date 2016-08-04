class AdvisorsController < ApplicationController

  def signup
    @advisor = Advisor.new
  end

  def signup_action
    @advisor = Advisor.new(advisor_params)
    if @advisor.save
      redirect_to root_path, notice: "signed up"
    else
      redirect_to sign_path, notice: "not signed up. try again."
      # path to new view of profile
      # other path thats neeeded - new view of listing
      # for each -> also path to create action
    end
  end

  private
  def advisor_params
    params.require(:advisor).permit(:first_name, :second_name, :email, :password)
  end

end