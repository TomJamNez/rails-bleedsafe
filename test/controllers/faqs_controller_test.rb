require "test_helper"

class FaqsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get faqs_index_url
    assert_response :success
  end

  test "should get edit" do
    get faqs_edit_url
    assert_response :success
  end
end
