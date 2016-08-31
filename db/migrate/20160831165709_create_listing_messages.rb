class CreateListingMessages < ActiveRecord::Migration
  def change
    create_table :listing_messages do |t|
      t.text :content
      t.string :reply_address
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
