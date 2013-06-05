class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.integer :researcher_id
      t.string :title
      t.string :company
      t.string :location
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
