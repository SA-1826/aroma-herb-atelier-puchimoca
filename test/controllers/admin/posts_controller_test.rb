require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index,show" do
    get admin_posts_index,show_url
    assert_response :success
  end
end
