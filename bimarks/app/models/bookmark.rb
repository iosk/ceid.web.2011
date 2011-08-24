class Bookmark < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  #validates :url
  validates :q_review, :length => { :maximum => 140}
  attr_accessible :title, :q_review, :url

  default_scope :order => 'bookmarks.created_at DESC'
  has_many :ratings, :dependent => :destroy

end
