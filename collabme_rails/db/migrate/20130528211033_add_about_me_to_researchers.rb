class AddAboutMeToResearchers < ActiveRecord::Migration
  def change
    add_column :researchers, :about_me, :text
  end
end
