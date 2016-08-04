class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_image
      t.text :description
      t.integer :advisor_id

      t.timestamps null: false
    end
  end
end
