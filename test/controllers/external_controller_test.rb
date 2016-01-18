require 'test_helper'

# Test for public facing pages
class ExternalControllerTest < ActionController::TestCase
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
