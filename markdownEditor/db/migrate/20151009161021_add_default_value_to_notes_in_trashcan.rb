class AddDefaultValueToNotesInTrashcan < ActiveRecord::Migration
  def change
      change_column :notes, :inTrashcan, :boolean, :null => false, :default => false
  end
end
