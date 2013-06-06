class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :authors
      t.string :publisher
      t.integer :citations
      t.integer :year
      t.string :full_article_url

      t.timestamps
    end
  end
end
