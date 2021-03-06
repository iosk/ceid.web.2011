# Author: ios ~ under the dark side of the moon.

# We require digest in order to use SHA2 password encryption
require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password

  # A user has many bookmarks, and when the user is destroyed so are his/her bookmarks
  has_many :bookmarks, :dependent => :destroy
  has_many :bookmarkings, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  attr_accessible :username, :email, :password, :password_confirmation


  #No 2 users with the same email and/or name can exist
  validates :email, :uniqueness => true
  validates :username, :uniqueness => true

  # We add this one for password validation
  validates :password, :confirmation => true

  # A callback right before saving the user's data
  before_save :encrypt_password

  def has_password?(submitted_password)
    hashed_password == encrypt(submitted_password)
  end

  def self.authenticate(username, submitted_password)
	user = find_by_username(username)
	return nil  if user.nil?
	return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
	user = find_by_id(id)
	(user && (user.salt == cookie_salt)) ? user : nil
  end

  # Now this is where all the security magic happens
  # We are gonna use an SHA2 encryption over a salted password
  # Salted password is the password given by a user concatenated with the UTC timestamp
  # of that particular moment he decided to register. ~ wooooOOOooT ~ security achievement unlocked
  private

    def encrypt_password
      # We make a new salt only ONCE when a record is created.
      # It would be dumb to create multiple salts
      self.salt = make_salt if new_record?
      self.hashed_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
