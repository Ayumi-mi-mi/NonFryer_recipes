require "test_helper"

class OauthsControllerTest < ActionDispatch::IntegrationTest
  test "should get oauth" do
    get oauth_path(provider: "google")
    assert_response :success
  end

  test "should get callback" do
    get oauth_callback_path(provider: "google")
    assert_response :success
  end
end
