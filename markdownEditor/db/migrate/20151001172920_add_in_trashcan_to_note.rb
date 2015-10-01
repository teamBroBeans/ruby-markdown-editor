class AddInTrashcanToNote < ActiveRecord::Migration
  def change
    add_column :notes, :inTrashcan, :boolean
  end
end
