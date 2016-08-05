class Profile < ActiveRecord::Base

  # association
  belongs_to :advisor

  # validations
  validate :image_upload_max_size
    
  # associate uploaded image with model
  mount_uploader :profile_image, ProfileImageUploader

  # custom validator for upload img size
  private
  def image_upload_max_size      
    if profile_image.size > 5.megabytes
      errors.add(:profile_image, "please upload a smaller image.")
    end
  end

end
