class AddCreatorIdToPosts < ActiveRecord::Migration
  def up
    change_table :posts do |t|
  		t.integer(:creator_id)
  	end
  end
  
  def down
    change_table :posts do |t|
  		t.remove(:creator_id)
  	end
  end
end
