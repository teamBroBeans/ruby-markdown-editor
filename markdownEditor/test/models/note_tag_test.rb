require 'test_helper'

class NoteTagTest < ActiveSupport::TestCase
  test "creates valid record" do
    tag = Tag.new
    tag.name = "Test Tag"
    assert tag.save
  end
end
