class Group < ActiveRecord::Base
  attr_accessible :email, :name, :description
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
  has_many :group_memberships, :class_name => "ResearchGroupMember", :foreign_key => "group_id"  
  has_many :researchers, :class_name => "Researcher", :through => :group_memberships, :source => :researcher, :uniq => true
  has_many :posts, :as => :post_interface
end
