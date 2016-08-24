class Listing < ActiveRecord::Base

  # association
  belongs_to :advisor
  has_many :requests

  # validations
  validates_presence_of :title, :description, :price
  validate :image_upload_max_size

  # associate uploaded image with model
  mount_uploader :listing_image, ListingImageUploader

  # validator for img size
  private
  def image_upload_max_size
    if listing_image.size > 5.megabytes
      errors.add(:listing_image, "Please upload a smaller image.")
    end
  end

end
