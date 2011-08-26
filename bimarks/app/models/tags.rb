class Tags < ActiveRecord::Base
	has_many :taggings
	has_many :bookmakrs, :through => :taggings
	attr_accessible	:name

end
