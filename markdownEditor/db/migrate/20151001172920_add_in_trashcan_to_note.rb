class AddInTrashcanToNote < ActiveRecord::Migration
  def change
   add_column :notes, :inTrashcan, :boolean, :default => false
  end
end
