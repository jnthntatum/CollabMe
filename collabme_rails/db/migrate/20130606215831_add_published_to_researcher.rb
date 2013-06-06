class AddPublishedToResearcher < ActiveRecord::Migration
  def change
    add_column :researchers, :published, :boolean
  end
end
