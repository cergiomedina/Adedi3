require 'test_helper'

class MultaControllerTest < ActionController::TestCase
  setup do
    @multum = multa(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multa)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multum" do
    assert_difference('Multum.count') do
      post :create, multum: {  }
    end

    assert_redirected_to multum_path(assigns(:multum))
  end

  test "should show multum" do
    get :show, id: @multum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multum
    assert_response :success
  end

  test "should update multum" do
    patch :update, id: @multum, multum: {  }
    assert_redirected_to multum_path(assigns(:multum))
  end

  test "should destroy multum" do
    assert_difference('Multum.count', -1) do
      delete :destroy, id: @multum
    end

    assert_redirected_to multa_path
  end
end
