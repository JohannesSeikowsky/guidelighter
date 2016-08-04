class CreateAdvisors < ActiveRecord::Migration
  def change
    create_table :advisors do |t|
      t.string :first_name
      t.string :second_name
      t.string :email
      t.string :password_salt
      t.string :password

      t.timestamps null: false
    end
  end
end
