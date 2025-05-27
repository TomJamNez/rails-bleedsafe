require "test_helper"

class EmergencyModulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emergency_modules_index_url
    assert_response :success
  end

  test "should get show" do
    get emergency_modules_show_url
    assert_response :success
  end

  test "should get new" do
    get emergency_modules_new_url
    assert_response :success
  end

  test "should get edit" do
    get emergency_modules_edit_url
    assert_response :success
  end
end
