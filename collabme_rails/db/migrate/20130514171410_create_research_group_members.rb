class CreateResearchGroupMembers < ActiveRecord::Migration
  def change 
    create_table :research_group_members, :id => false do |t|
      t.integer :researcher_id
      t.integer :group_id
      t.timestamps
    end
    add_index( :research_group_members, [:researcher_id, :group_id], :name => "member_groups_index", :unique => true);
    add_index( :research_group_members, [:group_id, :researcher_id], :name => "group_members_index", :unique => true );
  end
end
