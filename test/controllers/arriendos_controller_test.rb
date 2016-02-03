require 'test_helper'

class ArriendosControllerTest < ActionController::TestCase
  setup do
    @arriendo = arriendos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arriendos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create arriendo" do
    assert_difference('Arriendo.count') do
      post :create, arriendo: {  }
    end

    assert_redirected_to arriendo_path(assigns(:arriendo))
  end

  test "should show arriendo" do
    get :show, id: @arriendo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @arriendo
    assert_response :success
  end

  test "should update arriendo" do
    patch :update, id: @arriendo, arriendo: {  }
    assert_redirected_to arriendo_path(assigns(:arriendo))
  end

  test "should destroy arriendo" do
    assert_difference('Arriendo.count', -1) do
      delete :destroy, id: @arriendo
    end

    assert_redirected_to arriendos_path
  end
end
