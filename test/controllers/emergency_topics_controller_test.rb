require "test_helper"

class EmergencyTopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get emergency_topics_show_url
    assert_response :success
  end

  test "should get new" do
    get emergency_topics_new_url
    assert_response :success
  end

  test "should get edit" do
    get emergency_topics_edit_url
    assert_response :success
  end
end
