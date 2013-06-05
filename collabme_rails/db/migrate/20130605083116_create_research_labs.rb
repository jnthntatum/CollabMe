class CreateResearchLabs < ActiveRecord::Migration
  def change
    create_table :research_labs do |t|
      t.integer :work_experience_id
      t.integer :school_id
      t.integer :company_id
      
      t.string :name
      t.string :location
      t.string :focus

      t.timestamps
    end
  end
end
