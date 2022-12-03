require "test_helper"

class Public::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_chats_new_url
    assert_response :success
  end

  test "should get show" do
    get public_chats_show_url
    assert_response :success
  end

  test "should get index" do
    get public_chats_index_url
    assert_response :success
  end
end
