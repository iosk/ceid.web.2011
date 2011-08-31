class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  belongs_to :bookmark
  
  validates :content, :presence => true, :length => { :maximum => 400 }
  validates :user_id, :presence => true
  validates :bookmark_id, :presence => true

  
  default_scope :order => 'comments.created_at DESC'

end
