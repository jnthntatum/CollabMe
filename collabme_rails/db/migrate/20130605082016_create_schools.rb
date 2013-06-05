class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :education_id
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
