require 'test_helper'

class ProtectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get indew" do
    get protections_indew_url
    assert_response :success
  end

  test "should get show" do
    get protections_show_url
    assert_response :success
  end

end
