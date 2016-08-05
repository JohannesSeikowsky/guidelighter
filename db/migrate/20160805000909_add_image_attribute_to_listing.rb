class AddImageAttributeToListing < ActiveRecord::Migration
  def change
    add_column :listings, :listing_image, :string
  end
end
