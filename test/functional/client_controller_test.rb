require 'test_helper'

class ClientControllerTest < ActionController::TestCase
  test "should get user_home" do
    get :user_home
    assert_response :success
  end

  test "should get proj_enquiry" do
    get :proj_enquiry
    assert_response :success
  end

  test "should get view_status" do
    get :view_status
    assert_response :success
  end

end
