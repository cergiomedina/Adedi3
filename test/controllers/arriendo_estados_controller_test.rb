require 'test_helper'

class ArriendoEstadosControllerTest < ActionController::TestCase
  setup do
    @arriendo_estado = arriendo_estados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arriendo_estados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create arriendo_estado" do
    assert_difference('ArriendoEstado.count') do
      post :create, arriendo_estado: {  }
    end

    assert_redirected_to arriendo_estado_path(assigns(:arriendo_estado))
  end

  test "should show arriendo_estado" do
    get :show, id: @arriendo_estado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @arriendo_estado
    assert_response :success
  end

  test "should update arriendo_estado" do
    patch :update, id: @arriendo_estado, arriendo_estado: {  }
    assert_redirected_to arriendo_estado_path(assigns(:arriendo_estado))
  end

  test "should destroy arriendo_estado" do
    assert_difference('ArriendoEstado.count', -1) do
      delete :destroy, id: @arriendo_estado
    end

    assert_redirected_to arriendo_estados_path
  end
end
