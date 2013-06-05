class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :work_experience_id
      t.string :activity

      t.timestamps
    end
  end
end
