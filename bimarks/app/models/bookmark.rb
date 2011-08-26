class Bookmark < ActiveRecord::Base
  belongs_to :user
  #validates :url
  validates :q_review, :length => { :maximum => 140}
  attr_accessible :title, :q_review, :url

  default_scope :order => 'bookmarks.created_at DESC'

  # Associations
  has_many :ratings, :dependent => :destroy
  has_many :taggings
  has_many :tags, :through => :taggings


  accepts_nested_attributes_for :ratings


	# Returns the number of the submitted ratings for this bookmark.
	def count_ratings
		self.ratings.all.count
	end

	def avg_rating
		# First we find the average rating of this bookmark
		@average = self.ratings.average(:stars)
		# Then we return 0 if @average = nil, or @average else.
		@average ? @average : 0
	end

end
