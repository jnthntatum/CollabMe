class MakeResourcesPolymorphic < ActiveRecord::Migration
  def up
  	change_table :resources do |t|
  		t.integer :resource_interface_id
  		t.string :resource_interface_type
  		t.index :resource_interface_id
  	end
  end

  def down
  	change_table :resources do |t|
  		t.remove :resource_interface_id, :resource_interface_type
  	end
  end
end
