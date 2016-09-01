class AddAttrToRequestModel < ActiveRecord::Migration
  def change
    add_column :requests, :indicated_interest, :text
  end
end
