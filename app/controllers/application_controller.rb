class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # availabe in view layer
  helper_method :return_advisor_first_name # for testing

  # session related helper methonds (not like session controller!)
  def log_in
    session[:id] = @advisor.id
  end

  def log_out
    session[:id] = nil
  end

  def logged_in?
    session[:id]
  end

  def return_advisor_first_name
   Advisor.find(session[:id]).first_name
  end

end
