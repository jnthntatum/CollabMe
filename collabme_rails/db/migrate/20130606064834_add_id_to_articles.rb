class AddIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :authorid, :integer
  end
end
