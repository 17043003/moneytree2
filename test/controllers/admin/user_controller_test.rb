require 'test_helper'

class Admin::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_user_top_url
    assert_response :success
  end

end
