class AddSlugToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :slug, :string
  end
end
