class AddTagsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :tags, :string, default: "no_tags_yet"
  end
end
