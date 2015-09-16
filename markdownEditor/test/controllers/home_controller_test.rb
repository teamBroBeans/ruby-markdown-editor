require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get textEditor" do
    get :textEditor
    assert_response :success
  end

end
