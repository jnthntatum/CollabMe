class AddAidToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :aid, :integer
  end
end
