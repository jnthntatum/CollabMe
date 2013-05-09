class Researcher < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname
  has_many :owned_projects, :class_name => "Project", :foreign_key => "researcher_id" 
  has_and_belongs_to_many :memberof, :class_name => "Project", :association_foreign_key => "project_id", :foreign_key => "researcher_id"
  
  validates :firstname, presence: true
  validates :lastname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
