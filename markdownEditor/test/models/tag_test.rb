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
  
  test "should not save if tag already exists" do
    tag = Tag.new(name: "Tag")
    assert tag.save
    
    tag2 = Tag.new(name: "Tag")
    assert !tag2.save
  end
end
