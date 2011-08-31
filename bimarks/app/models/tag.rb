class Tag < ActiveRecord::Base

	has_many :taggings
	has_many :bookmarks, :through => :taggings, :foreign_key => :bookmark_id
	attr_accessible	:name, :bookmarks
	
	def count
	  self.bookmarks.count
	end



end
