class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :education_id
      t.string :course_title
      t.string :description

      t.timestamps
    end
  end
end
