class RequestsController < ApplicationController

  def new_request
  end

  def create_request
    redirect_to successful_request_path, notice: "Your request has been sent."
  end

  def successful_request
  end

end
