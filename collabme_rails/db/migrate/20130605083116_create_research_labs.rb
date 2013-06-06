class CreateResearchLabs < ActiveRecord::Migration
  def change
    create_table :research_labs do |t|      
      t.string :name
      t.string :location
      t.string :focus

      t.timestamps
    end
  end
end
