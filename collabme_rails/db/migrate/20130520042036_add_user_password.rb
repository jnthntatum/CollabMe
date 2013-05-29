class AddUserPassword < ActiveRecord::Migration
  def change
    add_column :researchers, :salt, :string
    add_column :researchers, :password_digest, :string
  end
end
