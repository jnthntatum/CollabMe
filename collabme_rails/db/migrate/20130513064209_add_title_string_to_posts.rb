class AddTitleStringToPosts < ActiveRecord::Migration
  def up
  	change_table :posts do |t|
  		t.string(:title)
  	end
  end

  def down
  	change_table :posts do |t|
  		t.remove(:title) 
  	end
  end
end
