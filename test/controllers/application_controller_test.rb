require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  setup do
  end

  test "should get home as logged out user" do
    get :home
    assert_response :success
  end
end
