require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get new_user_reg" do
    get :new_user_reg
    assert_response :success
  end
  
  test "should show the admin page if user-version is admin" do
    user = users(:user)
    get :selection, {"username" => user.username, "password" => user.password, "version" => user.version}
    assert_redirected_to "user/admin"
  end

end
