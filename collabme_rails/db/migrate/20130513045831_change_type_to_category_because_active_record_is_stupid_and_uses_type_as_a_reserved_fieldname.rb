class ChangeTypeToCategoryBecauseActiveRecordIsStupidAndUsesTypeAsAReservedFieldname < ActiveRecord::Migration
  def up
  	remove_index :tasks, :name=>"index_tasks_on_project_id_and_creator_id_and_assignee_id"

  	rename_column :tasks, :type, :category
  	add_index :tasks, :creator_id
  	add_index :tasks, :assignee_id
  	add_index :tasks, :project_id
  end

  def down
  	rename_column :tasks, :category, :type
  end
end
