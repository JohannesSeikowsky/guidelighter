class Profile < ActiveRecord::Base

  # association
  belongs_to :advisor

  # validations
  validates_presence_of :description
  validates_presence_of :profile_image
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
