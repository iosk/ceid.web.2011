class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :bookmark

	attr_accessible	:stars
	
	validates :user_id, :presence => true
	validates :article_id, :presence => true
	validates :stars, :presence => true, :numericality => true, :inclusion => { :in => 0..5 }

end
