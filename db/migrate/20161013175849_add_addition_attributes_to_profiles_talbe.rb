class AddAdditionAttributesToProfilesTalbe < ActiveRecord::Migration
  def change
    add_column :profiles, :application_help, :boolean, default: true
    add_column :profiles, :career_insights_help, :boolean, default: true
    add_column :profiles, :mentoring_help, :boolean, default: true
    add_column :profiles, :general_help, :boolean, default: true
    add_column :profiles, :session_price, :integer
  end
end
