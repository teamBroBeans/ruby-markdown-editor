require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "creates valid record" do
    note = Note.new
    note.title = "Hello World"
    note.tag = "#hiWorld"
    note.inputText = "#Hello World# "
    assert note.save
  end

  test "should not save unless title is filled in" do
    note = Note.new
    assert !note.save
    assert note.errors[:title].include?("can't be blank")
  end

    test "should not save unless tag is filled in" do
      note = Note.new
      assert !note.save
      assert note.errors[:tag].include?("can't be blank")
    end
  
end
