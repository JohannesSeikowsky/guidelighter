class Profile < ActiveRecord::Base

  # association
  belongs_to :advisor

  # validations
  validates_presence_of :description
  validates_presence_of :profile_image
  validates_presence_of :job_title  
  validates_presence_of :application_help
  validates_presence_of :career_insights_help 
  validates_presence_of :mentoring_help
  validates_presence_of :general_help
  validates_presence_of :session_price

  validate :image_upload_max_size
      
  # associate uploaded img with model
  mount_uploader :profile_image, ProfileImageUploader

  # validator for image size
  private
  def image_upload_max_size      
    if profile_image.size > 5.megabytes
      errors.add(:profile_image, "Please upload a smaller image.")
    end
  end

end
