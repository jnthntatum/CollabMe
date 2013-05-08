class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.references :researcher

      t.timestamps
    end
    add_index :projects, :researcher_id
  end
end
