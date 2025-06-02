require "test_helper"

class CrimeMapConfigsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crime_map_configs_index_url
    assert_response :success
  end
end
