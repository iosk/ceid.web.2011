class Fix2Tags < ActiveRecord::Migration
  def self.up
    remove_index :tags, :name
    add_index :tags, :name
  end

  def self.down
    remove_index :tags, :name
    add_index :tags, :name, :unique => true
  end
end
