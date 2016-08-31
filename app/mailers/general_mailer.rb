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
    mail(to: "founders@guidelighter.com, seikowsky@gmail.com, ogiberstein@gmail.com, surojitc@gmail.com", subject: "Request.")
  end

  def contact_us_message(message)
    @message = message
    mail(to: "founders@guidelighter.com, seikowsky@gmail.com, ogiberstein@gmail.com, surojitc@gmail.com", subject: "Conact_Us.")
  end

end
