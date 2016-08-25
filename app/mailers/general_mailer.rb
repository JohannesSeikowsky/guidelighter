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
end
