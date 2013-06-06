class Researcher < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
  attr_accessible :email, :first_name, :last_name, :about_me
  has_many :owned_projects, :class_name => "Project", :foreign_key => "researcher_id" 
  has_and_belongs_to_many :memberof, :class_name => "Project", :association_foreign_key => "project_id", :foreign_key => "researcher_id"
  has_many :direct_friendships, :class_name => "Friendship", :foreign_key => "user_id"
  has_many :direct_friends, :class_name => "Researcher",:through => :direct_friendships, :source => :friend, :uniq => true
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :class_name => "Researcher",:through => :inverse_friendships,  :source => :user, :uniq => true

  has_many :group_memberships, :class_name => "ResearchGroupMember", :foreign_key => "researcher_id"  
  has_many :groups, :class_name => "Group", :through => :group_memberships, :source => :group, :uniq => true
  
  has_one :photo
  has_many :posts, :as => :post_interface
  
  has_many :requests, :as => :request_interface

  has_many :work_experiences
  has_many :educations

  # Friends
  def friends
    ResearchersHelper.Friends(self);
  end

  def chat_info
    ResearchersHelper.FriendsInfo(self)
  end; 

  def friendships
    return direct_friendships.concat(inverse_friendships);
  end
  
  def full_name
    self.first_name + ' ' + self.last_name
  end 

  validates_presence_of :first_name
  validates_presence_of :last_name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # Passwords
  def password
    @password
  end

  def password=(plaintext_password)
    self.salt = SecureRandom.urlsafe_base64
    self.password_digest = Digest::SHA1.hexdigest(plaintext_password + self.salt)
    @password = plaintext_password
  end

  def password_present?
    ! @password.nil?
  end

  def password_valid?(plaintext_password)
    return self.password_digest == Digest::SHA1.hexdigest(plaintext_password + self.salt)
  end

  attr_accessible :password, :password_digest, :salt, :password_confirmation
  validates_presence_of :password, :if => :password_present?
  validates_confirmation_of :password, :if => :password_present?
  validates_presence_of :password_confirmation, :if => :password_present?
end