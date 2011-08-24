class CreateRatings < ActiveRecord::Migration
  def self.up
	drop_table :ratings

	create_table :ratings do |t|
      		t.integer :user_id, :null => false                              # foreign key
		t.integer :bookmark_id, :null => false                           # foreign key     
		t.integer :stars
		t.timestamps
    end
   
    add_index :ratings, :bookmark_id
  end

  def self.down
	drop_table :ratings
  end
end
