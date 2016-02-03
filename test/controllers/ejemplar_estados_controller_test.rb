require 'test_helper'

class EjemplarEstadosControllerTest < ActionController::TestCase
  setup do
    @ejemplar_estado = ejemplar_estados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ejemplar_estados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ejemplar_estado" do
    assert_difference('EjemplarEstado.count') do
      post :create, ejemplar_estado: {  }
    end

    assert_redirected_to ejemplar_estado_path(assigns(:ejemplar_estado))
  end

  test "should show ejemplar_estado" do
    get :show, id: @ejemplar_estado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ejemplar_estado
    assert_response :success
  end

  test "should update ejemplar_estado" do
    patch :update, id: @ejemplar_estado, ejemplar_estado: {  }
    assert_redirected_to ejemplar_estado_path(assigns(:ejemplar_estado))
  end

  test "should destroy ejemplar_estado" do
    assert_difference('EjemplarEstado.count', -1) do
      delete :destroy, id: @ejemplar_estado
    end

    assert_redirected_to ejemplar_estados_path
  end
end
