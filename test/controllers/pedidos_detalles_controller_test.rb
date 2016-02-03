require 'test_helper'

class PedidosDetallesControllerTest < ActionController::TestCase
  setup do
    @pedidos_detalle = pedidos_detalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedidos_detalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedidos_detalle" do
    assert_difference('PedidosDetalle.count') do
      post :create, pedidos_detalle: {  }
    end

    assert_redirected_to pedidos_detalle_path(assigns(:pedidos_detalle))
  end

  test "should show pedidos_detalle" do
    get :show, id: @pedidos_detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pedidos_detalle
    assert_response :success
  end

  test "should update pedidos_detalle" do
    patch :update, id: @pedidos_detalle, pedidos_detalle: {  }
    assert_redirected_to pedidos_detalle_path(assigns(:pedidos_detalle))
  end

  test "should destroy pedidos_detalle" do
    assert_difference('PedidosDetalle.count', -1) do
      delete :destroy, id: @pedidos_detalle
    end

    assert_redirected_to pedidos_detalles_path
  end
end
