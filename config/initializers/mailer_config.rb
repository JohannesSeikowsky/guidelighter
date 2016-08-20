ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "https://guidelighter.herokuapp.com/",
  :user_name            => "founders@guidelighter.com",
  :password             => ENV["GMAIL_PASS"],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "https://guidelighter.herokuapp.com/" if Rails.env.production?
ActionMailer::Base.default_url_options[:host] = "http://localhost:3000/" if Rails.env.development?
