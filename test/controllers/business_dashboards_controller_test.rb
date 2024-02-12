require "test_helper"

class BusinessDashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get business_dashboards_new_url
    assert_response :success
  end

  test "should get create" do
    get business_dashboards_create_url
    assert_response :success
  end

  test "should get update" do
    get business_dashboards_update_url
    assert_response :success
  end

  test "should get destroy" do
    get business_dashboards_destroy_url
    assert_response :success
  end
end
