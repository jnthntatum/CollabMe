class Task < ActiveRecord::Base
  attr_accessible :desc, :type
  belongs_to :project
  belongs_to :creator, :class_name => "Researcher", :foreign_key => "creator_id"
  belongs_to :assignee, :class_name => "Researcher", :foreign_key => "assignee_id"
end
