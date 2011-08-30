class Bookmark < ActiveRecord::Base
  belongs_to :user
  #validates :url
  validates :q_review, :length => { :maximum => 140}
  attr_accessible :title, :q_review, :url, :tags_attributes, :tag_ids

 # default_scope :order => 'bookmarks.created_at DESC'

  # Associations
  has_many :ratings, :dependent => :destroy
  has_many :taggings, :dependent => :destroy 
  has_many :tags, :through => :taggings, :foreign_key => :tag_id
  # This lambda function automagically rejects all tag creations for which their name is blank. (we don't need no blank tags)
  accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true, :update_only => true
  
  before_save :check_for_existing_tag
  
  def check_for_existing_tag
    if self.tags
      hash = self.tags
      hash.each{ |k| 
      new_tag = Tag.find_by_name(k.name) 
      if new_tag
        self.tags.delete(k)
        self.tags << new_tag
      end
      }
    end
  end
  
  
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
	
	def owner
	 @owner = self.user.username
	end

def self.search(search)
  if search
    where('title LIKE ? OR q_review LIKE ?', "%#{search}%" ,"%#{search}%")
  else
    scoped
  end
end

def self.search_by_tag(search)
  if search
    find(:all, :conditions => [ 'tags.name LIKE ?', "%#{search}%"], :joins => [:tags])
  else
    scoped
  end
end
    
    
  
end
