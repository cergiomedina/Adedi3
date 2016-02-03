require 'test_helper'

class ClienteEstadosControllerTest < ActionController::TestCase
  setup do
    @cliente_estado = cliente_estados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cliente_estados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente_estado" do
    assert_difference('ClienteEstado.count') do
      post :create, cliente_estado: {  }
    end

    assert_redirected_to cliente_estado_path(assigns(:cliente_estado))
  end

  test "should show cliente_estado" do
    get :show, id: @cliente_estado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente_estado
    assert_response :success
  end

  test "should update cliente_estado" do
    patch :update, id: @cliente_estado, cliente_estado: {  }
    assert_redirected_to cliente_estado_path(assigns(:cliente_estado))
  end

  test "should destroy cliente_estado" do
    assert_difference('ClienteEstado.count', -1) do
      delete :destroy, id: @cliente_estado
    end

    assert_redirected_to cliente_estados_path
  end
end
