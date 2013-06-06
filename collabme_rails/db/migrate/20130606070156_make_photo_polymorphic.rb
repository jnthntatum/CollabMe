class MakePhotoPolymorphic < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.integer :photo_interface_id
      t.string :photo_interface_type
      t.index :photo_interface_id
    end
  end
end
