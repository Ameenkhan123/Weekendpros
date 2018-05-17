require 'test_helper'

class AuthsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auths_index_url
    assert_response :success
  end

end
