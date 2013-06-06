class AddCitationsToResearchers < ActiveRecord::Migration
  def change
    add_column :researchers, :citations, :int
  end
end
