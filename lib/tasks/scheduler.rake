desc "Daily requests count"
task :daily_requests_count => :environment do
  # get no. of requests created in the past 24 hours
  require 'time'
  @number_of_requests = Request.where(created_at: (Time.now - 24.hours)..Time.now).count
  GeneralMailer.daily_requests_count(@number_of_requests).deliver if Rails.env.production?
end
