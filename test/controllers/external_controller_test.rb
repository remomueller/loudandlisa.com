# frozen_string_literal: true

require 'test_helper'

# Test for public facing pages.
class ExternalControllerTest < ActionController::TestCase
  test 'should get home as public user' do
    get :home
    assert_response :success
  end

  test 'should get demos as public user' do
    get :demos
    assert_response :success
  end

  test 'should get services as public user' do
    get :services
    assert_response :success
  end

  test 'should get contact as public user' do
    get :contact
    assert_response :success
  end

  test 'should submit contact as public user' do
    post :submit_contact, params: {
      name: 'Name', email: 'test@example.com', body: "Line 1\nLine 2"
    }
    assert_redirected_to thanks_path
  end

  test 'should not submit contact as public user with missing fields' do
    post :submit_contact, params: { name: '', email: '', body: '' }
    assert_response :success
    assert_template 'contact'
  end

  test 'should get version' do
    get :version
    assert_response :success
  end

  test 'should get version as json' do
    get :version, format: 'json'
    version = JSON.parse(response.body)
    assert_equal WwwLoudandlisaCom::VERSION::STRING, version['version']['string']
    assert_equal WwwLoudandlisaCom::VERSION::MAJOR, version['version']['major']
    assert_equal WwwLoudandlisaCom::VERSION::MINOR, version['version']['minor']
    assert_equal WwwLoudandlisaCom::VERSION::TINY, version['version']['tiny']
    assert_equal WwwLoudandlisaCom::VERSION::BUILD, version['version']['build']
    assert_response :success
  end
end
