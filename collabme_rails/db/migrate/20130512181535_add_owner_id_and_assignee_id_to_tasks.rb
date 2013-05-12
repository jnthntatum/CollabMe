class AddOwnerIdAndAssigneeIdToTasks < ActiveRecord::Migration
  def up
  	change_table :tasks do |t|
  		t.references :project
  		t.integer :creator_id
  		t.integer :assignee_id
  	end
  	add_index(:tasks, [:project_id, :creator_id, :assignee_id])
  end

  def down
  	change_table :tasks do |t|
  		t.remove(:project_id, :creator_id, :assignee_id) 
  	end
  end
end
