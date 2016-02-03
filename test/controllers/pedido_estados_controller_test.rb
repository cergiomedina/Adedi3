require 'test_helper'

class PedidoEstadosControllerTest < ActionController::TestCase
  setup do
    @pedido_estado = pedido_estados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedido_estados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedido_estado" do
    assert_difference('PedidoEstado.count') do
      post :create, pedido_estado: {  }
    end

    assert_redirected_to pedido_estado_path(assigns(:pedido_estado))
  end

  test "should show pedido_estado" do
    get :show, id: @pedido_estado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pedido_estado
    assert_response :success
  end

  test "should update pedido_estado" do
    patch :update, id: @pedido_estado, pedido_estado: {  }
    assert_redirected_to pedido_estado_path(assigns(:pedido_estado))
  end

  test "should destroy pedido_estado" do
    assert_difference('PedidoEstado.count', -1) do
      delete :destroy, id: @pedido_estado
    end

    assert_redirected_to pedido_estados_path
  end
end
