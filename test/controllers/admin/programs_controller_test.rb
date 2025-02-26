require "test_helper"

class Admin::ProgramsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_programs_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_programs_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_programs_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_programs_edit_url
    assert_response :success
  end
end
