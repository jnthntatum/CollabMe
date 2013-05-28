class AddFieldsToResearchers < ActiveRecord::Migration
  def change
    add_column :researchers, :experience, :text
    add_column :researchers, :publications, :text
  end
end
