require 'test_helper'

class ShipControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ship_new_url
    assert_response :success
  end

  test "should get index" do
    get ship_index_url
    assert_response :success
  end

  test "should get edit" do
    get ship_edit_url
    assert_response :success
  end

end
