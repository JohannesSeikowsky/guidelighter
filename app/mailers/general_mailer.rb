class GeneralMailer < ApplicationMailer
  default from: "founders@guidelighter.com"

  def successful_signup(advisor)
    @advisor = advisor
    mail(to: advisor.email, subject: "Signed up!")
  end 

  def request_notification(request)
    @request = request
    @listing = request.listing
    @advisor = @listing.advisor
    mail(to: "founders@guidelighter.com, seikowsky@gmail.com, ogiberstein@gmail.com, surojitc@gmail.com", subject: "New Request for a Listing")
  end

  def request_delivery_confirmation(request)
    @requested_title = request.listing.title
    @requesting_email = request.requesting_email
    mail(to: @requesting_email, subject: "Your request has been sent.")
  end

  def contact_us_message(message)
    @message = message
    mail(to: "founders@guidelighter.com, seikowsky@gmail.com, ogiberstein@gmail.com, surojitc@gmail.com", subject: "New Message from Contact-Us Form")
  end

  def listing_message(message, listing)
    @message = message
    @listing = listing
    mail(to: "founders@guidelighter.com, seikowsky@gmail.com, ogiberstein@gmail.com, surojitc@gmail.com", subject: "New Message from a specific Listing")
  end

  def daily_requests_count(number_of_requests)
    @number_of_requests = number_of_requests
    mail(to: "founders@guidelighter.com, seikowsky@gmail.com, ogiberstein@gmail.com, surojitc@gmail.com, jannik-black@gmx.de", subject: "Daily Requests Count")
  end

  def pw_retrieval_email(requesting_email, pw_reset_identifier)
    @pw_reset_identifier = pw_reset_identifier
    @requesting_email = requesting_email
    mail(to: @requesting_email, subject: "Password reset")
  end

end
