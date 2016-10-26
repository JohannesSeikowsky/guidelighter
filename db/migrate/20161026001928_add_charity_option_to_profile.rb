class AddCharityOptionToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :charity_option, :boolean, default: false
  end
end
