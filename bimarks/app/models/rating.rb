class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :bookmark

	attr_accessible	:stars
	
	validates :user_id, :presence => true
	validates :bookmark_id, :presence => true
	validates :stars, :presence => true, :numericality => true, :inclusion => { :in => 0..5 }
  	accepts_nested_attributes_for :bookmark
end
