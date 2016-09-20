class AddIdentifierToAdvisor < ActiveRecord::Migration
  def change
    add_column :advisors, :pw_reset_identifier, :string
  end
end
