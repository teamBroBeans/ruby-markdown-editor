class CreateNoteTags < ActiveRecord::Migration
  def change
    create_table :note_tags do |t|

      t.timestamps null: false
    end
  end
end
