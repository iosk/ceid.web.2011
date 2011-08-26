class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
	t.string :name
	t.integer :bookmark_id
      t.timestamps
    end
    add_index :tags, :name, :unique => true
  end

  def self.down
    drop_table :tags
  end
end
