require "test_helper"

class TrainingTopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get training_topics_show_url
    assert_response :success
  end

  test "should get new" do
    get training_topics_new_url
    assert_response :success
  end

  test "should get edit" do
    get training_topics_edit_url
    assert_response :success
  end
end
