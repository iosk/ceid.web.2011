class FixUsers < ActiveRecord::Migration
  def self.up
	remove_column :users, :status
	add_column :users, :is_admin, :boolean, :default => 0
  end

  def self.down
	remove_column :users, :is_admin
	add_column  :users, :status
  end
end
