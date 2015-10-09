class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.string :tag
      t.string :inputText
      # t.integer :user_id

      t.timestamps null: false
    end
  end
end
