require 'test_helper'

class TransicionArriendosControllerTest < ActionController::TestCase
  setup do
    @transicion_arriendo = transicion_arriendos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transicion_arriendos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transicion_arriendo" do
    assert_difference('TransicionArriendo.count') do
      post :create, transicion_arriendo: {  }
    end

    assert_redirected_to transicion_arriendo_path(assigns(:transicion_arriendo))
  end

  test "should show transicion_arriendo" do
    get :show, id: @transicion_arriendo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transicion_arriendo
    assert_response :success
  end

  test "should update transicion_arriendo" do
    patch :update, id: @transicion_arriendo, transicion_arriendo: {  }
    assert_redirected_to transicion_arriendo_path(assigns(:transicion_arriendo))
  end

  test "should destroy transicion_arriendo" do
    assert_difference('TransicionArriendo.count', -1) do
      delete :destroy, id: @transicion_arriendo
    end

    assert_redirected_to transicion_arriendos_path
  end
end
