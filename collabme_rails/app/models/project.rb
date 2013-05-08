class Project < ActiveRecord::Base
  	belongs_to :owner, :class_name => "Researcher", :foreign_key => "researcher_id" 
  	has_and_belongs_to_many :members, :class_name => "Researcher",
		:join_table => "projects_researchers", 
		:association_foreign_key => "researcher_id",
		:foreign_key => "project_id"
	has_many :posts, :as => :post_interface 
 	attr_accessible :name, :description, :owner
end
