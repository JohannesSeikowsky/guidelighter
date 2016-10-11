class ChangeAttributeName < ActiveRecord::Migration
  def change
    rename_column :requests, :listing_id, :advisor_id
  end
end
