require "test_helper"

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get idex" do
    get about_idex_url
    assert_response :success
  end
end
