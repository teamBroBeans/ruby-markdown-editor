class ChangeNoteTagsToNotesTags < ActiveRecord::Migration
  def change
    rename_table :note_tags, :notes_tags
  end
end
