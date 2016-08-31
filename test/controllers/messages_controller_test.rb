require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should get create_contact_us_msg" do
    get :create_contact_us_msg
    assert_response :success
  end

end
