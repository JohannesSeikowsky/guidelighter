class AddNameToListingsRequests < ActiveRecord::Migration
  def change
    add_column :requests, :requesting_name, :string
  end
end
