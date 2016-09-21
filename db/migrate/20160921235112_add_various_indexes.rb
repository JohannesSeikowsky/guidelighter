class AddVariousIndexes < ActiveRecord::Migration
  def change
    add_index :advisors, :email, unique: true
    add_index :advisors, :pw_reset_identifier
  end
end
