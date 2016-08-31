class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.text :content
      t.string :reply_address

      t.timestamps null: false
    end
  end
end
