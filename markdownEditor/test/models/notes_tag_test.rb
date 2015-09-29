require 'test_helper'

class NotesTagTest < ActiveSupport::TestCase
  test "creates valid record" do
    noteTag = NotesTag.new
    noteTag.tag_id = 1
    noteTag.note_id = 1
    
    assert noteTag.save
  end
  
  test "should not save if tag_id missing" do
    noteTag = NotesTag.new
    
    assert !noteTag.save
  end
end
