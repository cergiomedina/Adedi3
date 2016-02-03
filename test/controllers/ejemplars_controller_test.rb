require 'test_helper'

class EjemplarsControllerTest < ActionController::TestCase
  setup do
    @ejemplar = ejemplars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ejemplars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ejemplar" do
    assert_difference('Ejemplar.count') do
      post :create, ejemplar: {  }
    end

    assert_redirected_to ejemplar_path(assigns(:ejemplar))
  end

  test "should show ejemplar" do
    get :show, id: @ejemplar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ejemplar
    assert_response :success
  end

  test "should update ejemplar" do
    patch :update, id: @ejemplar, ejemplar: {  }
    assert_redirected_to ejemplar_path(assigns(:ejemplar))
  end

  test "should destroy ejemplar" do
    assert_difference('Ejemplar.count', -1) do
      delete :destroy, id: @ejemplar
    end

    assert_redirected_to ejemplars_path
  end
end
