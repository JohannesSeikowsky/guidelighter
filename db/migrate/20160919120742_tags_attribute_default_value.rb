class TagsAttributeDefaultValue < ActiveRecord::Migration
  def change
    change_column :listings, :tags, :string, default: "no_tag_yet"
  end
end
