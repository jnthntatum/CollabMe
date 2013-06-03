class MakeRequestPolymorphic < ActiveRecord::Migration
  def up
  	change_table :requests do |t|
  		t.integer :request_interface_id
  		t.string :request_interface_type
  		t.index :request_interface_id
  	end
  end

  def down
  	change_table :requests do |t|
  		t.remove :request_interface_id, :request_interface_type
  	end
  end
end
