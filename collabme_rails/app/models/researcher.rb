class Researcher < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :owned_projects, :class_name => "Project", :foreign_key => "project_id"
  belongs_to :shared_projects, :class_name => "Project", :foreign_key => "project_id"
end
