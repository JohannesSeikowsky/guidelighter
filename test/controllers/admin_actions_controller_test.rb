require 'test_helper'

class AdminActionsControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get general" do
    get :general
    assert_response :success
  end

end
