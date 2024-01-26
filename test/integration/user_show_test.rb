require "test_helper"

class UserShowTest < ActionDispatch::IntegrationTest

  def setup
    @inactive_user = users(:inactive)
    @activated_user = users(:archer)
  end

  test "should redirect when user not activated" do
    get user_path(@inactive_user)
    assert_response :redirect
    assert_redirected_to root_path
  end

end