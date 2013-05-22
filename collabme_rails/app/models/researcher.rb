=begin
Researcher Model -- class representation of users
=end
class Researcher < ActiveRecord::Base

  # CONSTANTS - Need to double-check#
  EMAIL_MAX_LENGTH = 50
  PASSWORD_MIN_LENGTH = 4
  PASSWORD_MAX_LENGTH = 25
  PASSWORD_RANGE = PASSWORD_MIN_LENGTH..PASSWORD_MAX_LENGTH

  attr_accessible :email, :first_name, :last_name
  has_many :owned_projects, :class_name => "Project", :foreign_key => "researcher_id" 
  has_and_belongs_to_many :memberof, :class_name => "Project", :association_foreign_key => "project_id", :foreign_key => "researcher_id"
  has_many :direct_friendships, :class_name => "Friendship", :foreign_key => "user_id"
  has_many :direct_friends, :class_name => "Researcher",:through => :direct_friendships, :source => :friend, :uniq => true
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :class_name => "Researcher",:through => :inverse_friendships,  :source => :user, :uniq => true

  has_many :group_memberships, :class_name => "ResearchGroupMember", :foreign_key => "researcher_id"  
  has_many :groups, :class_name => "Group", :through => :group_memberships, :source => :group, :uniq => true

  # Friends
  def friends
    ResearchersHelper.Friends(self);
  end

  def friendships
    return direct_friendships.concat(inverse_friendships);
  end

  #Note for extensive validation, we can define a "validate" method,
  #which calls errors.add([parameter], [error message]) whenever
  #an invalid parameter is found
  
  #Need to validate format of names. What should we allow?
  #O'Flaherty <- Need apostrophes
  #McFlaherty <- Need to allow upper/lower case
  #Wall-E <- Need to allow dashes
  #That it? Or allow _ and digits too?

  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # Passwords
  def password
    @password
  end

  def password=(plaintext_password)
    self.salt = SecureRandom.urlsafe_base64
    #self.salt = 'salt'
    self.password_digest = Digest::SHA1.hexdigest(plaintext_password + self.salt)
    @password = plaintext_password
  end

  def password_valid?(plaintext_password)
    return self.password_digest == Digest::SHA1.hexdigest(plaintext_password + self.salt)
  end

  attr_accessible :password, :password_digest, :salt, :password_confirmation
  validates :password, :presence => true, :confirmation => true
  validates :password_confirmation, :presence => true
  #need to validate password length also
  validates_length_of :password, :within => PASSWORD_RANGE
end