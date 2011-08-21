class AddUniqueNameAndEmail < ActiveRecord::Migration
  def self.up
    add_index :users, :email, :unique => true
    add_index :users, :username, :unique => true
  end

  def self.down
    remove_index :users, :email
    remove_index :users, :username, :unique => true
  end
end
