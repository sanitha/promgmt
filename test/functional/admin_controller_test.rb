require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get admin_home" do
    get :admin_home
    assert_response :success
  end

  test "should get runnning_proj" do
    get :runnning_proj
    assert_response :success
  end

  test "should get block_user" do
    get :block_user
    assert_response :success
  end

  test "should get proj_status" do
    get :proj_status
    assert_response :success
  end

  test "should get team_creation" do
    get :team_creation
    assert_response :success
  end

  test "should get add_employee" do
    get :add_employee
    assert_response :success
  end

end
