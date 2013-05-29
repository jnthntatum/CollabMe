class Project < ActiveRecord::Base
	acts_as_taggable
  	acts_as_taggable_on :skills, :interests
  	belongs_to :owner, :class_name => "Researcher", :foreign_key => "researcher_id" 
  	has_and_belongs_to_many :members, :class_name => "Researcher",
		:join_table => "projects_researchers", 
		:association_foreign_key => "researcher_id",
		:foreign_key => "project_id"	
	has_many :posts, :as => :post_interface
	has_many :tasks

 	attr_accessible :name, :description, :owner
end
