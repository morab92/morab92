require 'test_helper'

class SandboxControllerTest < ActionController::TestCase
  test "should get products" do
    get :products
    assert_response :success
  end

end
