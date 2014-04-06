class AddPasswordToClub < ActiveRecord::Migration
  def up
    add_column :clubs, :password_digest, :string
  end
  def down
    remove_column :clubs, :password_digest
  end
end
