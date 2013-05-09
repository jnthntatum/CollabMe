class RemoveResearcherIdFromProjects < ActiveRecord::Migration
  	def up
  		change_table :projects do |t|
		  	t.rename :Researcher_id, :researcher_id
		end
  	end

  def down
  		change_table :projects do |t|
		 	t.rename :researcher_id, :Researcher_id
		end
  	end
end
