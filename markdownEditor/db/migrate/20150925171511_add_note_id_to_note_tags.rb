class AddNoteIdToNoteTags < ActiveRecord::Migration
  def change
    add_reference :note_tags, :note, index: true, foreign_key: true
  end
end
