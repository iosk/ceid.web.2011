class AddFlaggedToBookmarks < ActiveRecord::Migration
  def self.up
  	add_column :bookmarks, :flagged, :boolean
    add_column :tags, :flagged, :boolean
  end

  def self.down
    remove_column :bookmarks, :flagged, :boolean
    remove_column :tags, :flagged, :boolean
  end
end
