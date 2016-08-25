class Request < ActiveRecord::Base

  # associations
  belongs_to :listing
  # validations
  validates_presence_of :requesting_email, :requesting_availability

end