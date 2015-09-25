class AddTagIdToNoteTags < ActiveRecord::Migration
  def change
    add_reference :note_tags, :tag, index: true, foreign_key: true
  end
end
