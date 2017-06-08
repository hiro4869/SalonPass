require 'test_helper'

class OwnerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get owner_show_url
    assert_response :success
  end

  test "should get owner" do
    get owner_owner_url
    assert_response :success
  end

end
