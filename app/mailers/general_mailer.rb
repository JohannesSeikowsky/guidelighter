class GeneralMailer < ApplicationMailer
  default from: "founders@guidelighter.com"

  def successful_signup(advisor)
    @advisor = advisor
    mail(to: advisor.email, subject: "Signed up!")
  end 

  def request_notification(advisor, request)
    @advisor = advisor
    @request = request
    mail(to: "founders@guidelighter.com, seikowsky@gmail.com, ogiberstein@gmail.com, surojitc@gmail.com", subject: "New Request")
  end

  def request_delivery_confirmation(advisor, request)
    @advisor = advisor
    @requesting_email = request.requesting_email
    mail(to: @requesting_email, subject: "Success.")
  end

  def contact_us_message(message)
    @message = message
    mail(to: "founders@guidelighter.com, seikowsky@gmail.com, ogiberstein@gmail.com, surojitc@gmail.com", subject: "New Message from Contact-Us Form")
  end

  def question_message(advisor, content, reply_address)
    @advisor = advisor
    @content = content
    @reply_address = reply_address
    mail(to: "founders@guidelighter.com, seikowsky@gmail.com, ogiberstein@gmail.com, surojitc@gmail.com", subject: "Question from user")
  end

  def daily_requests_count(number_of_requests)
    @number_of_requests = number_of_requests
    mail(to: "founders@guidelighter.com, seikowsky@gmail.com, ogiberstein@gmail.com, surojitc@gmail.com", subject: "Daily Requests Count")
  end

  def pw_retrieval_email(requesting_email, pw_reset_identifier)
    @pw_reset_identifier = pw_reset_identifier
    @requesting_email = requesting_email
    mail(to: @requesting_email, subject: "Guidelighter Password reset")
  end
end
