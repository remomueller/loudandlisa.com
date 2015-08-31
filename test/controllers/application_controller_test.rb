require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  setup do
  end

  test "should get home as logged out user" do
    get :home
    assert_response :success
  end

  test "should get demos as logged out user" do
    get :demos
    assert_response :success
  end

  test "should get services as logged out user" do
    get :services
    assert_response :success
  end

  test "should get contact as logged out user" do
    get :contact
    assert_response :success
  end

  test "should submit contact as logged out user" do
    post :submit_contact, name: 'Name', email: 'test@example.com', body: 'Line 1\nLine 2'
    assert_redirected_to contact_path
  end

  test "should not submit contact as logged out user with missing fields" do
    post :submit_contact, name: '', email: '', body: ''
    assert_response :success
    assert_template 'contact'
  end

end
