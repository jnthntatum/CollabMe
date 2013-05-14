=begin
Researcher Model -- class representation of users
=end
class Researcher < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  has_many :owned_projects, :class_name => "Project", :foreign_key => "researcher_id" 
  has_and_belongs_to_many :memberof, :class_name => "Project", :association_foreign_key => "project_id", :foreign_key => "researcher_id"
  has_many :direct_friendships, :class_name => "Friendship", :foreign_key => "user_id"
  has_many :direct_friends, :class_name => "Researcher",:through => :direct_friendships, :source => :friend, :uniq => true
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :class_name => "Researcher",:through => :inverse_friendships,  :source => :user, :uniq => true

  has_many :group_memberships, :class_name => "ResearchGroupMember", :foreign_key => "researcher_id"  
  has_many :groups, :class_name => "Group", :through => :group_memberships, :source => :group, :uniq => true

  def friends
  	ResearchersHelper.Friends(self);
  end

  def friendships
  	return direct_friendships.concat(inverse_friendships);
  end
  	
  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
