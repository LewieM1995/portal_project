require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get buildings" do
    get admin_buildings_url
    assert_response :success
  end
end
