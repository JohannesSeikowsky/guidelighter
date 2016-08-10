class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # available in views
  helper_method :logged_in?

  # session related helper methods
  def log_in
    session[:id] = @advisor.id
  end

  def log_out
    session[:id] = nil
  end

  def logged_in?
    session[:id]
  end

end
