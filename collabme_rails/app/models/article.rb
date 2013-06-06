class Article < ActiveRecord::Base
  attr_accessible :authors, :citations, :full_article_url, :publisher, :title, :year, :authorid
end
