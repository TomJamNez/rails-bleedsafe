require "test_helper"

class CrimePostcodeExclusionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crime_postcode_exclusions_index_url
    assert_response :success
  end
end
