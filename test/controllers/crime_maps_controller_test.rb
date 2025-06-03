require "test_helper"

class CrimeMapsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crime_maps_index_url
    assert_response :success
  end
end
