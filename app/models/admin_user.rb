class AdminUser < ActiveRecord::Base
 has_and_belongs_to_many :pages 
 has_many :section_edits
 has_many :sections, :through => :section_edits
  scope :named, lambda {|first, last| where(:first_name=> first, :last_name => last)}
attr_accessor :password

validates_length_of :password, :within => 5..25, :on => :create
before_save :create_hashed_password
after_save :clear_password

attr_protected :hashed_password, :salt 
def self.make_salt(username="")
	Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
end

def self.hash_with_salt(password="", salt="")
	Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
end

def self.authenticate(username="", password="")
	  user=AdminUser.find_by_username(username)
	  if user && user.password_match?(password)
	  	return user
	  else
	  	return false
	  end
end
  def password_match?(password="")
  	hashed_password==AdminUser.hash_with_salt(password,salt)
  end

private
 def create_hashed_password
 	unless password ==nil
 		self.salt=AdminUser.make_salt(username) if salt==nil
 		self.hashed_password= AdminUser.hash_with_salt(password,salt)
    end
end
def clear_password
	self.password = nil
end
end
