require "test_helper"

class Public::DirectmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_directmails_show_url
    assert_response :success
  end
end
