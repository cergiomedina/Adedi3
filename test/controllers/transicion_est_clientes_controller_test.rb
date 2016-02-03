require 'test_helper'

class TransicionEstClientesControllerTest < ActionController::TestCase
  setup do
    @transicion_est_cliente = transicion_est_clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transicion_est_clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transicion_est_cliente" do
    assert_difference('TransicionEstCliente.count') do
      post :create, transicion_est_cliente: {  }
    end

    assert_redirected_to transicion_est_cliente_path(assigns(:transicion_est_cliente))
  end

  test "should show transicion_est_cliente" do
    get :show, id: @transicion_est_cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transicion_est_cliente
    assert_response :success
  end

  test "should update transicion_est_cliente" do
    patch :update, id: @transicion_est_cliente, transicion_est_cliente: {  }
    assert_redirected_to transicion_est_cliente_path(assigns(:transicion_est_cliente))
  end

  test "should destroy transicion_est_cliente" do
    assert_difference('TransicionEstCliente.count', -1) do
      delete :destroy, id: @transicion_est_cliente
    end

    assert_redirected_to transicion_est_clientes_path
  end
end
