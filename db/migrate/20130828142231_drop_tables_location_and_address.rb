class DropTablesLocationAndAddress < ActiveRecord::Migration
  def change
    drop_table :locations
    drop_table :addresses
  end
end
