require 'test_helper'

class ListingsfilterControllerTest < ActionController::TestCase
  test "should get find_listing" do
    get :find_listing
    assert_response :success
  end

end
