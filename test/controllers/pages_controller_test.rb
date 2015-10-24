require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get notice" do
    get :notice
    assert_response :success
  end

end
