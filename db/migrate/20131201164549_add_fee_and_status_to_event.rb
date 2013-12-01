class AddFeeAndStatusToEvent < ActiveRecord::Migration
  def change
    add_column :events, :fee, :decimal
    add_column :events, :approved, :boolean
  end
end
