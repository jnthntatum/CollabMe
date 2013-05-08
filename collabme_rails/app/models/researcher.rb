class Researcher < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :owned_projects, :class_name => "Project", :foreign_key => "researcher_id" 
  has_and_belongs_to_many :memberof, :class_name => "Project", :association_foreign_key => "project_id", :foreign_key => "researcher_id"
end
