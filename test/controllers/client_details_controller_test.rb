require "test_helper"

class ClientDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_detail = client_details(:one)
  end

  test "should get index" do
    get client_details_url
    assert_response :success
  end

  test "should get new" do
    get new_client_detail_url
    assert_response :success
  end

  test "should create client_detail" do
    assert_difference("ClientDetail.count") do
      post client_details_url, params: { client_detail: { client_address: @client_detail.client_address, client_id: @client_detail.client_id, client_name: @client_detail.client_name, client_postcode: @client_detail.client_postcode, email: @client_detail.email, number: @client_detail.number } }
    end

    assert_redirected_to client_detail_url(ClientDetail.last)
  end

  test "should show client_detail" do
    get client_detail_url(@client_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_detail_url(@client_detail)
    assert_response :success
  end

  test "should update client_detail" do
    patch client_detail_url(@client_detail), params: { client_detail: { client_address: @client_detail.client_address, client_id: @client_detail.client_id, client_name: @client_detail.client_name, client_postcode: @client_detail.client_postcode, email: @client_detail.email, number: @client_detail.number } }
    assert_redirected_to client_detail_url(@client_detail)
  end

  test "should destroy client_detail" do
    assert_difference("ClientDetail.count", -1) do
      delete client_detail_url(@client_detail)
    end

    assert_redirected_to client_details_url
  end
end
