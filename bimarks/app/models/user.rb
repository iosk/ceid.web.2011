class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :password, :presence => true
  validates :email, :presence => true
  has_many :bookmarks
end
