class AddUserIdToNotes < ActiveRecord::Migration
  def change
    add_reference(:notes, :user, foreign_key: true, index: true)
  end
end
