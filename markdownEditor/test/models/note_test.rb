require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "creates valid record" do
    note = Note.new
    note.title = "Hello World"
    note.tag = "#hiWorld"
    note.inputText = "#Hello World# "
    assert note.save
end
  
end
