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
    noteTag.note_id = 1
    
    assert !noteTag.save
    assert noteTag.errors[:tag_id].include?("can't be blank")
  end
  
  test "should not save if note_id missing" do
    noteTag = NotesTag.new
    noteTag.tag_id = 1
    
    assert !noteTag.save
    assert noteTag.errors[:note_id].include?("can't be blank")
  end
end
