class AddOpenToResearchers < ActiveRecord::Migration
  def change
    add_column :researchers, :open, :boolean
  end
end
