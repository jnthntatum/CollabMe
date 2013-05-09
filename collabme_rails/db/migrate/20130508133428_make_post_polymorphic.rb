class MakePostPolymorphic < ActiveRecord::Migration
  def up
  	change_table :posts do |t|
  		t.integer :post_interface_id
  		t.string :post_interface_type
  		t.index :post_interface_id
  	end
  end

  def down
  	change_table :posts do |t|
  		t.remove :post_interface_id, :post_interface_type
  	end
  end
end
