class GeneralMailer < ApplicationMailer

  def successful_signup(advisor)
    @advisor = advisor
    mail(:to => advisor.email, :subject => "Signed up!", from: "founders@guidelighter.com")
  end 

end
