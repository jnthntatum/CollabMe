class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.references :Researcher

      t.timestamps
    end
    add_index :projects, :Researcher_id
  end
end
