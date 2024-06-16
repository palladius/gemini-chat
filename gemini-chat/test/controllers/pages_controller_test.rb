require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get no_auth" do
    get pages_no_auth_url
    assert_response :success
  end
end
