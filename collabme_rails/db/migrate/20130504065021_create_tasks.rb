class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :type
      t.string :desc

      t.timestamps
    end
  end
end
