class GeneralMailer < ApplicationMailer
  default from: "founders@guidelighter.com"

  def successful_signup(advisor)
    @advisor = advisor
    mail(to: advisor.email, subject: "Signed up!")
  end 
end
