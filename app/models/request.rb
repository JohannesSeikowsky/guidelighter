class Request < ActiveRecord::Base

  # associations
  belongs_to :listing
  # validations
  validates_presence_of :indicated_interest, :requesting_availability, :requesting_email, :requesting_name

end