require "test_helper"

class TrainingModulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get training_modules_index_url
    assert_response :success
  end

  test "should get show" do
    get training_modules_show_url
    assert_response :success
  end

  test "should get new" do
    get training_modules_new_url
    assert_response :success
  end

  test "should get edit" do
    get training_modules_edit_url
    assert_response :success
  end
end
