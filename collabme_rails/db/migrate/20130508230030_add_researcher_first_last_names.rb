class AddResearcherFirstLastNames < ActiveRecord::Migration
  def change
    remove_column :researchers, :name
    add_column :researchers, :firstname, :string
    add_column :researchers, :lastname, :string
  end
end
