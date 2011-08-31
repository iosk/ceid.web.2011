class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :content
      t.integer :bookmark_id
      t.integer :user_id
      t.boolean :flagged

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :bookmark_id
  end

  def self.down
    drop_table :comments
  end
end
