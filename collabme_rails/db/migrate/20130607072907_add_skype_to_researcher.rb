class AddSkypeToResearcher < ActiveRecord::Migration
  def change
    add_column :researchers, :skype, :string
  end
end
