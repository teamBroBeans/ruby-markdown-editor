require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "creates valid record" do
    tag = Tag.new
    tag.name = "Test Tag"
    assert tag.save
  end
  
  test "should not save unless name filled in" do
    tag = Tag.new
    assert !tag.save
    assert tag.errors[:name].include?("can't be blank")
  end
  
end
