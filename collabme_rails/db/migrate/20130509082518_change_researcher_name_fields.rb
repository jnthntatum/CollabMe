class ChangeResearcherNameFields < ActiveRecord::Migration
  def change
    change_table :researchers do |t|
      t.rename :firstname, :first_name
      t.rename :lastname, :last_name
    end
  end
end
