require "application_system_test_case"

class ClientDetailsTest < ApplicationSystemTestCase
  setup do
    @client_detail = client_details(:one)
  end

  test "visiting the index" do
    visit client_details_url
    assert_selector "h1", text: "Client details"
  end

  test "should create client detail" do
    visit client_details_url
    click_on "New client detail"

    fill_in "Client address", with: @client_detail.client_address
    fill_in "Client", with: @client_detail.client_id
    fill_in "Client name", with: @client_detail.client_name
    fill_in "Client postcode", with: @client_detail.client_postcode
    fill_in "Email", with: @client_detail.email
    fill_in "Number", with: @client_detail.number
    click_on "Create Client detail"

    assert_text "Client detail was successfully created"
    click_on "Back"
  end

  test "should update Client detail" do
    visit client_detail_url(@client_detail)
    click_on "Edit this client detail", match: :first

    fill_in "Client address", with: @client_detail.client_address
    fill_in "Client", with: @client_detail.client_id
    fill_in "Client name", with: @client_detail.client_name
    fill_in "Client postcode", with: @client_detail.client_postcode
    fill_in "Email", with: @client_detail.email
    fill_in "Number", with: @client_detail.number
    click_on "Update Client detail"

    assert_text "Client detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Client detail" do
    visit client_detail_url(@client_detail)
    click_on "Destroy this client detail", match: :first

    assert_text "Client detail was successfully destroyed"
  end
end
