class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :bookmarks, :through => :taggings
	attr_accessible	:name, :bookmarks

end
