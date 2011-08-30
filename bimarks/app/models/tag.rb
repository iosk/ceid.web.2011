class Tag < ActiveRecord::Base
 # validates_uniqueness_of :name

	has_many :taggings
	has_many :bookmarks, :through => :taggings, :foreign_key => :bookmark_id
	attr_accessible	:name, :bookmarks
	
	def count
	  self.bookmarks.count
	end



end
