require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get findResearchers" do
    get :findResearchers
    assert_response :success
  end

end
