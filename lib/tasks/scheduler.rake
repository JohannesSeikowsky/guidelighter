desc "Daily requests count"
task :daily_requests_count => :environment do
  # get no. of requests created in the past 24 hours
  require 'time'
  @requests = Request.where(created_at: (Time.now - 24.hours)..Time.now)
  @number_of_requests = @requests.count
  GeneralMailer.successful_signup(@number_of_requests).deliver if Rails.env.production?
end