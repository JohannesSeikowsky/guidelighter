class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :requesting_email
      t.text :requesting_availability
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
