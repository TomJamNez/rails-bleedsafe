require "test_helper"

class FirstAidItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get first_aid_items_index_url
    assert_response :success
  end
end
