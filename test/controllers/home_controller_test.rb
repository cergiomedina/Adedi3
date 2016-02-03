require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get ayuda" do
    get :ayuda
    assert_response :success
  end

  test "should get acerca" do
    get :acerca
    assert_response :success
  end

end
