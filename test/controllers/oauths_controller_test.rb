require "test_helper"

class OauthsControllerTest < ActionDispatch::IntegrationTest
  test "should get oauth" do
    get oauths_oauth_url
    assert_response :redirect
  end

  test "should get callback" do
    get oauths_callback_url
    assert_response :success
  end
end
