class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :work_experience_id
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
