class Bookmark < ActiveRecord::Base
  belongs_to :user
  #validates :url
  validates :q_review, :length => { :maximum => 140}
  attr_accessible :title, :q_review, :url, :tags_attributes, :tag_ids

 # default_scope :order => 'bookmarks.created_at DESC'

  # Associations
  has_many :bookmarkings, :dependent => :destroy  
  has_many :ratings, :dependent => :destroy
  has_many :taggings, :dependent => :destroy 
  has_many :tags, :through => :taggings, :foreign_key => :tag_id
  has_many :comments, :dependent => :destroy
  # This lambda function automagically rejects all tag creations for which their name is blank. (we don't need no blank tags)
  accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true, :update_only => true
  
  before_save :check_for_existing_tag
  before_save :create_bookmarking
  
  
  def create_bookmarking
    bookmarking = Bookmarking.new(:user_id => self.user.id, :bookmark_id => self.id)
    bookmarking.save
  end
  
  def check_for_existing_tag
    if !(self.tags.empty?)
      tags = self.tags.clone
      for tag in tags do
        existing_tag = Tag.find(:all, :conditions => {:name => tag.name.to_s}).first
        if !(existing_tag.nil?)
           self.tags.delete(tag)
           self.tags << existing_tag
        end
      end
      
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
