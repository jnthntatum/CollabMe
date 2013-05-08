class Project < ActiveRecord::Base
  belongs_to :owner, :class_name => "Researcher", :foreign_key => "researcher_id"
  has_many :members, :class_name => "Researcher", :foreign_key => "researcher_id"
  attr_accessible :name, :description, :owner
end
