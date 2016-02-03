require 'test_helper'

class TransicionEstPedidosControllerTest < ActionController::TestCase
  setup do
    @transicion_est_pedido = transicion_est_pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transicion_est_pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transicion_est_pedido" do
    assert_difference('TransicionEstPedido.count') do
      post :create, transicion_est_pedido: {  }
    end

    assert_redirected_to transicion_est_pedido_path(assigns(:transicion_est_pedido))
  end

  test "should show transicion_est_pedido" do
    get :show, id: @transicion_est_pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transicion_est_pedido
    assert_response :success
  end

  test "should update transicion_est_pedido" do
    patch :update, id: @transicion_est_pedido, transicion_est_pedido: {  }
    assert_redirected_to transicion_est_pedido_path(assigns(:transicion_est_pedido))
  end

  test "should destroy transicion_est_pedido" do
    assert_difference('TransicionEstPedido.count', -1) do
      delete :destroy, id: @transicion_est_pedido
    end

    assert_redirected_to transicion_est_pedidos_path
  end
end
