# frozen_string_literal: true

require "test_helper"

# Test for public pages.
class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get demos as public user" do
    get demos_url
    assert_response :success
  end

  test "should get services as public user" do
    get services_url
    assert_response :success
  end

  test "should get contact as public user" do
    get contact_url
    assert_response :success
  end

  test "should submit contact as public user" do
    post submit_contact_url, params: {
      name: "Name", email: "test@example.com", body: "Line 1\nLine 2"
    }
    assert_redirected_to thanks_path
  end

  test "should not submit contact as public user with missing fields" do
    post submit_contact_url, params: { name: "", email: "", body: "" }
    assert_response :success
  end

  test "should get version" do
    get version_url
    assert_response :success
  end

  test "should get version as json" do
    get version_url(format: "json")
    version = JSON.parse(response.body)
    assert_equal LoudAndLisa::VERSION::STRING, version["version"]["string"]
    assert_equal LoudAndLisa::VERSION::MAJOR, version["version"]["major"]
    assert_equal LoudAndLisa::VERSION::MINOR, version["version"]["minor"]
    assert_equal LoudAndLisa::VERSION::TINY, version["version"]["tiny"]
    if LoudAndLisa::VERSION::BUILD.nil?
      assert_nil version["version"]["build"]
    else
      assert_equal LoudAndLisa::VERSION::BUILD, version["version"]["build"]
    end
    assert_response :success
  end
end
