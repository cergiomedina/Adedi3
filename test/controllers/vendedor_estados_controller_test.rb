require 'test_helper'

class VendedorEstadosControllerTest < ActionController::TestCase
  setup do
    @vendedor_estado = vendedor_estados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendedor_estados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendedor_estado" do
    assert_difference('VendedorEstado.count') do
      post :create, vendedor_estado: {  }
    end

    assert_redirected_to vendedor_estado_path(assigns(:vendedor_estado))
  end

  test "should show vendedor_estado" do
    get :show, id: @vendedor_estado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendedor_estado
    assert_response :success
  end

  test "should update vendedor_estado" do
    patch :update, id: @vendedor_estado, vendedor_estado: {  }
    assert_redirected_to vendedor_estado_path(assigns(:vendedor_estado))
  end

  test "should destroy vendedor_estado" do
    assert_difference('VendedorEstado.count', -1) do
      delete :destroy, id: @vendedor_estado
    end

    assert_redirected_to vendedor_estados_path
  end
end
