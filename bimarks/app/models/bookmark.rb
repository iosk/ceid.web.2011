class Bookmark < ActiveRecord::Base
  belongs_to :user
  #validates :url
  validates :q_review, :length => { :maximum => 140}
  attr_accessible :title, :q_review, :url, :date

  default_scope :order => 'bookmarks.created_at DESC'

end
