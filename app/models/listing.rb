class Listing < ActiveRecord::Base

  # association
  belongs_to :advisor

  # validations
  validate :image_upload_max_size

  # associate uploaded image with model
  mount_uploader :listing_image, ListingImageUploader

  # validator for img size
  private
  def image_upload_max_size
    if listing_image.size > 5.megabytes
      errors.add(:listing_image, "please upload a smaller image.")
    end
  end

end
