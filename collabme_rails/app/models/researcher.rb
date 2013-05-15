class Researcher < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  has_many :owned_projects, :class_name => "Project", :foreign_key => "researcher_id" 
  has_and_belongs_to_many :memberof, :class_name => "Project", :association_foreign_key => "project_id", :foreign_key => "researcher_id"
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }


  def self.search(search)
  	search_condition = "%" + search + "%"
  	find(:all, :conditions => ['first_name LIKE ? OR last_name LIKE ?', search_condition, search_condition])
  end
end
