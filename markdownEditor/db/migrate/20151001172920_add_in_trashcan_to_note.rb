class AddInTrashcanToNote < ActiveRecord::Migration
  def change
   change_column :notes, :inTrashcan, :boolean :default => false
  end
end
