class Profile < ActiveRecord::Base

  # association
  belongs_to :advisor

  # associating uploaded image with this model
  mount_uploader :profile_image, ProfileImageUploader

end
