class AddMaxNoOfSessionsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :max_no_of_session, :string
  end
end
