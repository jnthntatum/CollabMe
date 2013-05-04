class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :type
      t.string :value

      t.timestamps
    end
  end
end
