class CreateBookmarkings < ActiveRecord::Migration
  def self.up
    create_table :bookmarkings do |t|
      t.integer :bookmark_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarkings
  end
end
