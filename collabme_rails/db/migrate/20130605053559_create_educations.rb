class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer  :researcher_id
      t.integer  :school_id
      t.string   :degree
      t.string   :major
      t.string   :specialization
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
