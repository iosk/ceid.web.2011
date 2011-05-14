class User < ActiveRecord::Base
  has_many :bookmarks
end
