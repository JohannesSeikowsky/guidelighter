class SessionsController < ApplicationController
  def login
  end

  def login_action
    @advisor = Advisor.find_by_email(params[:login][:email])
    if @advisor && @advisor.password == BCrypt::Engine.hash_secret(params[:login][:password_provided], @advisor.password_salt)
      log_in
      if !@advisor.profile
        redirect_to new_profile_path, notice: "Logged in. Make a Profile."      
      else
        redirect_to new_listing_path, notice: "Logged in."
      end
    else
      Rails.logger.debug @advisor.errors.full_messages.join("\n")
      redirect_to login_path, notice: "Try again."
    end
  end

  def logout
    log_out
    redirect_to root_path, notice: "Logged out."
  end
end
