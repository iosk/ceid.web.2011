class FixTags < ActiveRecord::Migration
  def self.up
	remove_column :tags, :bookmark_id
  end

  def self.down
	add_column :tags, :bookmark_id
  end
end
