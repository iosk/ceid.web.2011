class User < ActiveRecord::Base
  has_many :bookmarks
  attr_accessible :username, :email, :password

#No 2 users with the same email and/or name can exist
  validates :email, :uniqueness => true
  validates :username, :uniqueness => true

end
